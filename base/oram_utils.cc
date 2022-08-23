/*
 Copyright (c) 2022 Haobin Chen

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
#include "oram_utils.h"

#include <lz4.h>
#include <spdlog/fmt/bin_to_hex.h>
#include <spdlog/spdlog.h>

#include <cstdarg>
#include <cstring>
#include <fstream>
#include <sstream>

#include "oram_crypto.h"

extern std::shared_ptr<spdlog::logger> logger;

namespace oram_utils {
std::string ReadKeyCrtFile(const std::string& path) {
  std::ifstream file(path, std::ifstream::in);
  std::ostringstream oss;

  if (file.good()) {
    oss << file.rdbuf();
    file.close();
  } else {
    logger->error("Failed to read key file: {}", path);
    return "";
  }

  return oss.str();
}

std::vector<std::string> ReadDataFromFile(const std::string& path) {
  std::ifstream file(path, std::ifstream::in);
  std::vector<std::string> data;

  if (file.good()) {
    std::string line;
    while (std::getline(file, line)) {
      data.emplace_back(line);
    }
    file.close();
  } else {
    logger->error("Failed to read data file: {}", path);
  }
  return data;
}

void SafeFree(void* ptr) {
  if (ptr != nullptr) {
    free(ptr);
  } else {
    logger->error("Failed to free nullptr");
  }
}

void SafeFreeAll(size_t ptr_num, ...) {
  va_list ap;
  va_start(ap, ptr_num);
  for (size_t i = 0; i < ptr_num; ++i) {
    void* ptr = va_arg(ap, void*);
    SafeFree(ptr);
  }
  va_end(ap);
}

void ConvertToBlock(const std::string& data,
                    partition_oram::oram_block_t* const block) {
  PANIC_IF(data.size() != ORAM_BLOCK_SIZE, "Invalid data size");

  memcpy(block, data.data(), ORAM_BLOCK_SIZE);
}

void ConvertToString(const partition_oram::oram_block_t* const block,
                     std::string* const data) {
  data->resize(ORAM_BLOCK_SIZE);
  memcpy(data->data(), (void*)block, ORAM_BLOCK_SIZE);
}

void CheckStatus(partition_oram::Status status, const std::string& reason) {
  if (status != partition_oram::Status::kOK) {
    logger->error("{}: {}", partition_oram::kErrorList.at(status), reason);
    abort();
  }
}

void PadStash(partition_oram::p_oram_stash_t* const stash,
              const size_t bucket_size) {
  const size_t stash_size = stash->size();
  if (stash_size < bucket_size) {
    for (size_t i = stash_size; i < bucket_size; ++i) {
      partition_oram::oram_block_t dummy;

      if (oram_crypto::Cryptor::RandomBytes((uint8_t*)(&dummy),
                                            ORAM_BLOCK_SIZE) !=
          partition_oram::Status::kOK) {
        logger->error("Failed to generate random bytes");
        abort();
      }

      stash->emplace_back(dummy);
    }
  }
}

partition_oram::p_oram_bucket_t SampleRandomBucket(size_t size,
                                                   size_t tree_size,
                                                   size_t initial_offset) {
  size >>= 1;
  partition_oram::p_oram_bucket_t bucket;

  for (size_t i = 0; i < tree_size; ++i) {
    partition_oram::oram_block_t block;
    block.header.block_id = i + initial_offset;
    block.header.type = i < size ? partition_oram::BlockType::kNormal
                                 : partition_oram::BlockType::kDummy;
    block.data[0] = i + initial_offset;

    if (oram_crypto::Cryptor::RandomBytes(block.data + 1,
                                          DEFAULT_ORAM_DATA_SIZE - 1) !=
        partition_oram::Status::kOK) {
      logger->error("Failed to generate random bytes");
      abort();
    }

    bucket.emplace_back(block);
  }

  // Do a shuffle.
  PANIC_IF(oram_crypto::Cryptor::RandomShuffle<partition_oram::oram_block_t>(
               bucket) != partition_oram::Status::kOK,
           "Random shuffle failed due to internal error.");

  return bucket;
}

std::vector<std::string> SerializeToStringVector(
    const partition_oram::p_oram_bucket_t& bucket) {
  std::vector<std::string> ans;

  for (size_t i = 0; i < bucket.size(); ++i) {
    std::string data;
    ConvertToString(&bucket[i], &data);
    ans.emplace_back(data);
  }

  return ans;
}

partition_oram::p_oram_bucket_t DeserializeFromStringVector(
    const std::vector<std::string>& data) {
  partition_oram::p_oram_bucket_t ans;

  for (size_t i = 0; i < data.size(); ++i) {
    partition_oram::oram_block_t block;
    ConvertToBlock(data[i], &block);
    ans.emplace_back(block);
  }

  return ans;
}

void PrintStash(const partition_oram::p_oram_stash_t& stash) {
  logger->debug("Stash:");

  for (size_t i = 0; i < stash.size(); ++i) {
    logger->debug("Block {}: type : {}, data: {}", stash[i].header.block_id,
                  (int)stash[i].header.type, stash[i].data[0]);
  }
}

void PrintOramTree(const partition_oram::server_storage_t& storage) {
  logger->debug("The size of the ORAM tree is {}", storage.size());

  for (auto iter = storage.begin(); iter != storage.end(); ++iter) {
    logger->debug("Tag {}, {}: ", iter->first.first, iter->first.second);

    for (const auto& block : iter->second) {
      // Decompress the storage.
      partition_oram::oram_block_t decompressed_block;
      DataDecompress(reinterpret_cast<const uint8_t*>(block.data()),
                     block.size(),
                     reinterpret_cast<uint8_t*>(&decompressed_block));

      logger->debug("id: {}, type: {}", decompressed_block.header.block_id,
                    (int)decompressed_block.header.type);
    }
  }
}

void EncryptBlock(partition_oram::oram_block_t* const block,
                  oram_crypto::Cryptor* const cryptor) {
  if (block->header.type != partition_oram::BlockType::kNormal) {
    return;
  }
  // First let us generate the iv.
  partition_oram::Status status = cryptor->RandomBytes(block->header.iv, 12);
  CheckStatus(status, "Failed to generate iv!");

  // Second prepare the buffer.
  std::string enc;
  status = cryptor->Encrypt(block->data, DEFAULT_ORAM_DATA_SIZE,
                            block->header.iv, &enc);
  CheckStatus(status, "Failed to encrypt data!");

  // Third, let us split the mac tag to the header.
  memcpy(block->header.mac_tag, enc.data() + enc.size() - 16, 16);

  // Finally, let us copy the encrypted data to the block.
  memcpy(block->data, enc.data(), enc.size() - 16);
}

void DecryptBlock(partition_oram::oram_block_t* const block,
                  oram_crypto::Cryptor* const cryptor) {
  if (block->header.type != partition_oram::BlockType::kNormal) {
    return;
  }
  // First, let us prepare the buffer.
  uint8_t* enc_data = (uint8_t*)malloc(DEFAULT_ORAM_DATA_SIZE + 16);

  // Second, let us copy the encrypted data to the buffer.
  memcpy(enc_data, block->data, DEFAULT_ORAM_DATA_SIZE);

  // Third, let us copy the mac tag to the buffer.
  memcpy(enc_data + DEFAULT_ORAM_DATA_SIZE, block->header.mac_tag, 16);

  // Fourth, let us decrypt the data.
  std::string dec;
  partition_oram::Status status = cryptor->Decrypt(
      enc_data, DEFAULT_ORAM_DATA_SIZE + 16, block->header.iv, &dec);
  CheckStatus(status, "Failed to decrypt data!");

  // Finally, let us copy the decrypted data to the block.
  memcpy(block->data, dec.data(), dec.size());

  SafeFree(enc_data);
}

size_t DataCompress(const uint8_t* data, size_t data_size, uint8_t* const out) {
  // Compress the source std::string with lz4 compression libarary.
  // The compressed data will be stored in the destination buffer.
  // The destination will be pre-allocated by the correct size.
  const size_t max_allowed_size = LZ4_compressBound(data_size);
  size_t compressed_size = LZ4_compress_default(
      reinterpret_cast<const char*>(data), reinterpret_cast<char*>(out),
      data_size, max_allowed_size);

  if (compressed_size == 0) {
    logger->error("Failed to compress data!");
    abort();
  }

  return compressed_size;
}

size_t DataDecompress(const uint8_t* data, size_t data_size,
                      uint8_t* const out) {
  // Decompress the source std::string with lz4 compression
  // library.
  const size_t max_allowed_size = data_size * 2;
  size_t decompressed_size = LZ4_decompress_safe(
      reinterpret_cast<const char*>(data), reinterpret_cast<char*>(out),
      data_size, max_allowed_size);

  if (decompressed_size == 0) {
    logger->error("Failed to decompress data!");
    abort();
  }

  return decompressed_size;
}
}  // namespace oram_utils

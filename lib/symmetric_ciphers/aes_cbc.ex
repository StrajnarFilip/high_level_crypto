defmodule SymmetricCiphers.AesCbc do
    @moduledoc """
    Documentation for `HighLevelCrypto`.
    """
  
    @doc """
    Accepts bytes (plaintext) and 256 bit (32 byte) key.
    First 16 bytes (128 bits) of returned value is IV (initialization vector),
    the rest is ciphertext (encrypted data)
    """
    def aes_encrypt(bytes, key) do
      # Generate random bytes for initialization vector
      iv= :crypto.strong_rand_bytes(16)
      # Encrypt
      encrypted_data = :crypto.crypto_one_time(:aes_256_cbc,key,iv,bytes,[{:encrypt,true},{:padding,:pkcs_padding}])
      # Concatenate IV bytes and encrypted bytes
      iv <> encrypted_data
    end
  
    @doc """
    Accepts bytes (ciphertext) and 256 bit (32 byte) key.
    First 16 bytes (128 bits) of bytes (ciphertext) is IV (initialization vector),
    the rest is actual encrypted data
    """
    def aes_decrypt(bytes, key) do
      # Extract first 16 bytes as IV
      <<iv::binary-size(16), ciphertext::binary>> = bytes 
      :crypto.crypto_one_time(:aes_256_cbc,key,iv,ciphertext,[{:encrypt,false},{:padding,:pkcs_padding}])
    end
  end
  
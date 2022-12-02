defmodule SymmetricCiphers.AesCbcTest do
  use ExUnit.Case
  import SymmetricCiphers.AesCbc

  test "aes cipher output" do
    key = :crypto.strong_rand_bytes(32)
    original = """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit,
    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
    nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
    reprehenderit in voluptate velit esse cillum dolore eu fugiat
    nulla pariatur. Excepteur sint occaecat cupidatat non proident,
    sunt in culpa qui officia deserunt mollit anim id est laborum.
    """
    ciphertext = aes_encrypt(original,key)
    plaintext = aes_decrypt(ciphertext,key)

    assert original == plaintext
  end
end

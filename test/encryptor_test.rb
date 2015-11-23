require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/encryptor'
require 'pry'

class EncryptorTest < Minitest::Test

  def test_can_encrypt_a_string
    e = Encryptor.new("string", 12345)
    e.key.generate_all
    e.encrypt_message

    assert_equal "7fot25", e.encrypted_message
  end

  def test_can_encrypt_a_string_with_no_key_given
    e = Encryptor.new("string")
    e.key.generate_all
    e.encrypt_message

    assert_equal "7fot25", e.encrypted_message
  end

  def test_can_decrypt_individual_letter
    e = Encryptor.new("s")
    e.key.generate_all

    assert_equal "7", e.encrypt_message
  end

end

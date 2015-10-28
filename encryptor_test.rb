require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'key_generator'
require_relative 'encryptor'
require_relative 'enigma'
require 'pry'

class EncryptorTest < Minitest::Test

  def test_can_create_encryptor_instance
    e = Encryptor.new

    assert e
  end

  def test_can_initialize_encryptor_with_no_message
    e = Encryptor.new

    refute e.message
  end

  def test_can_initialize_encryptor_with_key_generator
    e = Encryptor.new

    assert e.key
    assert_equal 12345, e.key.key
  end

  def test_can_call_master_encryption_key
    e = Encryptor.new

    assert e.encryption_key
  end

  def test_can_find_encryption_key_index_of_first_element_in_message
    e = Encryptor.new("t")
    e.encrypt_message

    assert_equal "5", e.encrypted_message[0]
  end

  def test_can_encrypt_letters_into_new_array
    e = Encryptor.new("st")
    e.encrypt_message

    assert_equal "4", e.encrypted_message[0]
    assert_equal "f", e.encrypted_message[1]
  end

  def test_can_encrypt_a_string
    e = Encryptor.new("string")
    e.encrypt_message

    assert_equal "4fotz5", e.encrypted_message
  end

end
  #
  #   assert_equal 12345, kg.key
  #   assert_equal 12, kg.a_key_offset
  #   assert_equal 23, kg.b_key_offset
  #   assert_equal 34, kg.c_key_offset
  #   assert_equal 45, kg.d_key_offset
  # end
  #
  # def test_can_generate_key_offsets_from_key_all
  #   kg = KeyGenerator.new(12345)
  #   kg.generate_key_offsets
  #
  #   assert_equal 12, kg.a
  #   assert_equal 23, kg.b
  #   assert_equal 34, kg.c
  #   assert_equal 45, kg.d
  # end

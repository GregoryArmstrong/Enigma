require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './decryptor'

class DecryptorTest < Minitest::Test

  def test_can_create_instance_of_decryptor
    d = Decryptor.new("4fotz5", 12345)

    assert d
  end

  def test_can_decrypt_message_given_correct_key
    d = Decryptor.new("4fotz5", 12345)

    assert_equal "string", d.decrypt_message
  end

end

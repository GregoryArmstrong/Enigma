require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require '../lib/decryptor'

class DecryptorTest < Minitest::Test

  def test_can_create_instance_of_decryptor
    d = Decryptor.new("7fot25", 12345)
    d.key.generate_all

    assert d
  end

  def test_can_decrypt_message_given_correct_key
    d = Decryptor.new("7fot25")
    d.key.generate_all

    assert_equal "string", d.decrypt_message
  end

  def test_can_decrypt_individual_letter
    d = Decryptor.new("7")
    d.key.generate_all

    assert_equal "s", d.decrypt_message
  end

end

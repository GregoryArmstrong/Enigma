require 'pry'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/enigma'

class EnigmaTest < Minitest::Test

  attr_accessor :enigma

  def setup
    @enigma = Enigma.new
  end

  def test_can_create_instance_of_enigma
    assert true, enigma
  end

  def test_has_no_message_to_start
    assert_equal nil, enigma.initialized_message
  end

  def test_has_no_key_to_start
    assert_equal nil, enigma.master_key
  end

  def test_has_no_date_to_start
    assert_equal nil, enigma.date
  end

  def test_encrypt_method_can_be_given_message
    assert_equal "83p4m.b37zdpmx8p228j", enigma.encrypt("test message ..end..")
  end

  def test_encrypt_can_be_given_message_and_key
    assert_equal "rm.n8uxmqiz.8gr.llr5", enigma.encrypt("test message ..end..", 34567)
  end

  def test_encrypt_can_be_given_message_key_and_date
    assert_equal "ql.j7txiphz77fr7kkr1", enigma.encrypt("test message ..end..", 34567, "11/10/1911")
  end

  def test_decrypt_method_can_be_given_message
    assert_equal "test message ..end..", enigma.decrypt("83p4m.b37zdpmx8p228j")
  end

  def test_decrypt_can_be_given_message_and_key
    assert_equal "test message ..end..", enigma.decrypt("rm.n8uxmqiz.8gr.llr5", 34567)
  end

  def test_decrypt_can_be_given_message_key_and_date
    assert_equal "test message ..end..", enigma.decrypt("ql.j7txiphz77fr7kkr1", 34567, "11/10/1911")
  end

  def test_enigma_takes_message
    e = Enigma.new("test message")

    assert_equal "test message", e.initialized_message
  end

  def test_enigma_can_encrypt_message
    e = Enigma.new("test message ..end..", 56789)

    assert_equal "a8u9rdg8,4iur2au77ao", e.encrypt
  end

  def test_enigma_can_decrypt_message
    e = Enigma.new("a8u9rdg8,4iur2au77ao", 56789)

    assert_equal "test message ..end..", e.decrypt
  end

  def test_enigma_can_crack_message
    e = Enigma.new("83p4m.b37zdpmx8p228j")

    assert_equal "test message ..end..", e.crack
  end

  def test_enigma_can_start_with_no_message_and_pass_message_to_encrypt
    assert_equal "a8u9rdg8,4iur2au77ao", enigma.encrypt("test message ..end..", 56789)
  end

  def test_enigma_can_start_with_no_message_and_pass_message_to_decrypt
    assert_equal "test message ..end..", enigma.decrypt("a8u9rdg8,4iur2au77ao", 56789)
  end

  def test_enigma_can_start_with_no_message_and_pass_message_to_crack
    assert_equal "test message ..end..", enigma.crack("83p4m.b37zdpmx8p228j")
  end

end

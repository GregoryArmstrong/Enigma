require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'enigma'

class EnigmaTest < Minitest::Test

  def test_can_create_instance_of_enigma
    e = Enigma.new

    assert true, e
  end

  def test_has_no_message_to_start
    e = Enigma.new

    assert_equal nil, e.message
  end

  def test_has_no_key_to_start
    e = Enigma.new

    assert_equal nil, e.master_key
  end

  def test_has_no_key_offsets_to_start
    e = Enigma.new

    assert_equal nil, e.a
    assert_equal nil, e.b
    assert_equal nil, e.c
    assert_equal nil, e.d
  end

  def test_has_key_after_running_keygenerator
    e = Enigma.new
    e.encrypt

    assert_equal 12345, e.master_key
  end

  def test_has_no_date_to_start
    e = Enigma.new

    assert_equal nil, e.date
  end

  def test_has_date_after_running_keygenerator
    e = Enigma.new
    e.encrypt

    assert_equal "0225", e.date
  end

  def test_has_final_offsets_after_running_encrypt
    e = Enigma.new
    e.encrypt

    assert_equal 12, e.a
    assert_equal 25, e.b
    assert_equal 36, e.c
    assert_equal 50, e.d
  end

  def test_can_create_encryptor_and_pass_in_attributes
    skip
    e = Enigma.new
    e.encrypt

    assert enc
  end



end

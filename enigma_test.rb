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

    assert_equal nil, e.key
  end

  def test_has_no_date_to_start
    e = Enigma.new

    assert_equal nil, e.date
  end

  def test_can_create_instance_of_key_generator
    e = Enigma.new
    e.encrypt

    refute_equal 12345, e.key
  end



end

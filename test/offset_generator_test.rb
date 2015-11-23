require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/offset_generator'
require '../lib/key_generator'
require '../lib/enigma'

class OffsetGeneratorTest < Minitest::Test

  def test_can_generate_key_offsets_from_key_all
    kg = KeyGenerator.new(12345)
    kg.generate_key_offsets

    assert_equal 12, kg.a
    assert_equal 23, kg.b
    assert_equal 34, kg.c
    assert_equal 45, kg.d
  end

end

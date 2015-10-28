require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'offset_generator'
require_relative 'key_generator'
require_relative 'enigma'

class OffsetGeneratorTest < Minitest::Test
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

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/key_generator'
require '../lib/enigma'

class KeyGeneratorTest < Minitest::Test

  attr_accessor :kg

  def setup
    @kg = KeyGenerator.new
  end

  def test_can_start_with_key_if_desired
    example = KeyGenerator.new(34567)

    assert_equal 34567, example.key
  end

  def test_can_generate_random_5_digit_key
    refute_equal 12345, kg.generate_key
  end

  def test_can_generate_key_offsets
    kg.generate_key_offsets

    assert_equal 12345, kg.key
    assert_equal 12, kg.a
    assert_equal 23, kg.b
    assert_equal 34, kg.c
    assert_equal 45, kg.d
  end

  def test_can_generate_final_date_offsets_from_date
    kg.generate_all
    assert_equal "3225", kg.date
  end

  def test_can_generate_date_offsets_from_given_date
    example = KeyGenerator.new(34567, "27/10/1910")
    example.generate_all

    assert_equal "0100", example.date
  end

  def test_can_generate_final_offsets_from_key_and_date_offsets
    kg.generate_all
    assert_equal 15, kg.a
    assert_equal 25, kg.b
    assert_equal 36, kg.c
    assert_equal 50, kg.d
  end

  def test_can_use_generate_all_for_attributes
    assert_equal 12345, kg.key
    kg.generate_all
    assert_equal 15, kg.a
    assert_equal 25, kg.b
    assert_equal 36, kg.c
    assert_equal 50, kg.d
  end

  def test_key_generator_can_format_date_if_given_date_object
    example = KeyGenerator.new(34567, Date.today)
    example.generate_all

    assert_equal "3225", example.date
  end

end

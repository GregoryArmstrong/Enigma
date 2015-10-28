require 'minitest'                # => true
require 'minitest/autorun'        # => true
require 'minitest/pride'          # => true
require_relative 'key_generator'  # => true
require_relative 'enigma'         # ~> LoadError: cannot load such file -- ./enigma

class KeyGeneratorTest < Minitest::Test

  def test_starts_with_no_key
    skip
    kg = KeyGenerator.new

    assert_equal nil, kg.key
  end

  def test_can_start_with_key_if_desired
    kg = KeyGenerator.new(12345)

    assert_equal 12345, kg.key
  end

  def test_can_generate_random_5_digit_key
    kg = KeyGenerator.new

    refute_equal 12345, kg.generate_key
  end

  def test_can_generate_key_offsets
    kg = KeyGenerator.new(12345)
    kg.generate_key_offsets

    assert_equal 12345, kg.key
    assert_equal 12, kg.a
    assert_equal 23, kg.b
    assert_equal 34, kg.c
    assert_equal 45, kg.d
  end

  def test_starts_with_no_date
    skip
    kg = KeyGenerator.new(12345)

    assert_equal nil, kg.date
  end

  def test_can_generate_date_offsets
    kg = KeyGenerator.new(12345)
    kg.generate_date

    assert_equal "28/10/2015", kg.date
  end

  def test_can_generate_final_date_offsets_from_date
    kg = KeyGenerator.new(12345)
    kg.generate_date
    kg.generate_date_offsets

    assert_equal "0225", kg.date
  end

  def test_can_generate_final_offsets_from_key_and_date_offsets
    kg = KeyGenerator.new(12345)
    kg.generate_key_offsets
    kg.generate_date
    kg.generate_date_offsets
    kg.generate_final_offsets

    assert_equal 12, kg.a
    assert_equal 25, kg.b
    assert_equal 36, kg.c
    assert_equal 50, kg.d
  end

  def test_can_use_generate_all_for_attributes
    kg = KeyGenerator.new(12345)
    kg.generate_all
    assert_equal 12345, kg.key
    assert_equal 12, kg.a
    assert_equal 25, kg.b
    assert_equal 36, kg.c
    assert_equal 50, kg.d
  end

end

# >> Run options: --seed 39678
# >>
# >> # Running:
# >>
# >>
# >>
# >> Finished in 0.000660s, 0.0000 runs/s, 0.0000 assertions/s.
# >>
# >> 0 runs, 0 assertions, 0 failures, 0 errors, 0 skips

# ~> LoadError
# ~> cannot load such file -- ./enigma
# ~>
# ~> /Users/gregoryarmstrong/.rvm/rubies/ruby-2.2.3/lib/ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/gregoryarmstrong/.rvm/rubies/ruby-2.2.3/lib/ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/gregoryarmstrong/turing/1module/Enigma/offset_generator.rb:1:in `<top (required)>'
# ~> /Users/gregoryarmstrong/turing/1module/Enigma/enigma.rb:2:in `require_relative'
# ~> /Users/gregoryarmstrong/turing/1module/Enigma/enigma.rb:2:in `<top (required)>'
# ~> /Users/gregoryarmstrong/turing/1module/Enigma/key_generator_test.rb:5:in `require_relative'
# ~> /Users/gregoryarmstrong/turing/1module/Enigma/key_generator_test.rb:5:in `<main>'

require 'minitest'                # => true
require 'minitest/autorun'        # => true
require 'minitest/pride'          # => true
require_relative 'key_generator'  # => true

class KeyGeneratorTest < Minitest::Test

  def test_starts_with_no_key
    kg = KeyGenerator.new      # => #<KeyGenerator:0x007fe85b021750 @key=nil>

    assert_equal nil, kg.key  # => true
  end

  def test_can_start_with_key_if_desired
    kg = KeyGenerator.new(12345)          # => #<KeyGenerator:0x007fe85b020030 @key=12345>

    assert_equal 12345, kg.key  # => true
  end

  def test_can_generate_random_5_digit_key
    kg = KeyGenerator.new                   # => #<KeyGenerator:0x007fe85b0228d0 @key=nil>

    refute_equal 12345, kg.generate_key  # => false
  end

end

# >> Run options: --seed 59667
# >>
# >> # Running:
# >>
# >> ...
# >>
# >> Finished in 0.001035s, 2899.8984 runs/s, 2899.8984 assertions/s.
# >>
# >> 3 runs, 3 assertions, 0 failures, 0 errors, 0 skips

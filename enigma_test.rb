require 'minitest'          # => true
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require_relative 'enigma'   # ~> LoadError: cannot load such file -- ./enigma
# require_relative 'encryptor'
require 'pry'

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

  def test_has_no_date_to_start
    e = Enigma.new

    assert_equal nil, e.date
  end

  def test_has_date_after_running_keygenerator
    skip
    e = Enigma.new
    e.encrypt

    assert_equal "0225", e.date
  end

  def test_enigma_takes_message
    e = Enigma.new("test message")
    e.encrypt

    assert_equal "test message", e.message
  end

  def test_enigma_creates_encryptor_object
    e = Enigma.new
    e.encrypt
  end

end

# >> Run options: --seed 44936
# >>
# >> # Running:
# >>
# >>
# >>
# >> Finished in 0.000797s, 0.0000 runs/s, 0.0000 assertions/s.
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
# ~> /Users/gregoryarmstrong/turing/1module/Enigma/enigma_test.rb:4:in `require_relative'
# ~> /Users/gregoryarmstrong/turing/1module/Enigma/enigma_test.rb:4:in `<main>'

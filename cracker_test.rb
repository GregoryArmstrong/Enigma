require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'key_generator'
require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'enigma'
require_relative 'cracker'
require 'pry'

class CrackerTest < Minitest::Test

  def test_can_generate_instance_of_cracker
    c = Cracker.new("test message", 54321)

    assert c
  end

  def test_can_split_off_last_7_parts_of_message
    c = Cracker.new("53p4j.b34zdpjx8pz28j")
    c.isolate_known_message_pieces

    assert_equal "x8pz28j", c.known_message
  end

  def test_can_determine_positions_of_correct_key_rotations_from_entire_message_length
    c = Cracker.new("53p4j.b34zdpjx8pz28j")
    c.identify_rotation_positions

    assert_equal "d", c.last_rotation
  end

  def test_can_isolate_key_rotation_pairs_from_known_last_rotation
    c = Cracker.new("apslrxek,lg9rj.97o.3", 12345)
    c.isolate_known_message_pieces
    c.identify_rotation_positions
    c.pair_matching_rotations

    assert_equal ["7", "n"], c.a_pair
    assert_equal ["o", "d"], c.b_pair
    assert_equal [".", "."], c.c_pair
    assert_equal ["3", "."], c.d_pair
  end

  def test_uses_paired_offsets_to_generate_cracked_offsets
    c = Cracker.new("53p4j.b34zdpjx8pz28j")
    c.crack_message
    c.decrypt_cracked_message

    assert_equal "test message ..end..", c.message
  end

end

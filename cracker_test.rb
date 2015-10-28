require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'key_generator'
require_relative 'encryptor'
require_relative 'enigma'
require_relative 'cracker'
require 'pry'

class CrackerTest < Minitest::Test

  def test_can_generate_instance_of_cracker
    skip
    c = Cracker.new("test message", 54321)

    assert c
  end

  def test_new_instance_of_cracker_can_pass_key_to_key_generator
    skip
    c = Cracker.new("test message", 54321)

    assert_equal 54321, c.master_key.key
  end

  def test_can_generate_key_generator_instance_from_initialize
    skip
    c = Cracker.new

    assert c.master_key
  end

  def test_can_generate_date_offsets_from_key_generator
    skip
    c = Cracker.new("test message")
    c.generate_date_offsets

    assert_equal "0225", c.date
  end

  def test_can_split_off_last_7_parts_of_message
    skip
    c = Cracker.new("53p4j.b34zdpjx8pz28j")
    c.isolate_known_message_pieces

    assert_equal "x8pz28j", c.known_message
  end

  def test_can_determine_positions_of_correct_key_rotations_from_entire_message_length
    skip
    c = Cracker.new("53p4j.b34zdpjx8pz28j")
    c.identify_rotation_positions

    assert_equal "d", c.last_rotation
  end

  def test_can_isolate_key_rotation_pairs_from_known_last_rotation
    c = Cracker.new("apslrxek,lg9rj.97o.3", 12345)
    c.isolate_known_message_pieces
    c.identify_rotation_positions
    c.pair_matching_rotations

    assert_equal ["7"], c.a_pair        #n
    assert_equal ["jo"], c.b_pair       #. d
    assert_equal [".."], c.c_pair       #. .
    assert_equal ["93"], c.d_pair       #e .
  end

  def test_uses_paired_offsets_to_generate_original_message
    c = Cracker.new("apslrxek,lg9rj.97o.3")
    c.isolate_known_message_pieces
    c.identify_rotation_positions
    c.pair_matching_rotations
    c.decrypt_message

    assert_equal "test message ..end..", c.decrypted_message

  end
















end

require_relative 'key_generator'
require_relative 'encryptor'
require_relative 'decryptor'

class Cracker

  attr_accessor :message, :known_message, :last_rotation, :a_pair, :b_pair, :c_pair, :d_pair, :rotation_map, :decrypted_rotations

  def initialize(message=nil, known_message=nil, last_rotation=nil, a_pair=[], b_pair=[], c_pair=[], d_pair=[], rotation_map=[], decrypted_rotations=[])
    @message = message
    @known_message = known_message
    @last_rotation = last_rotation
    @a_pair = a_pair
    @b_pair = b_pair
    @c_pair = c_pair
    @d_pair = d_pair
    @rotation_map = rotation_map
    @decrypted_rotations = decrypted_rotations
  end

  def encryption_key
    encryption_key = ('a'..'z').to_a + ("0".."9").to_a + [" ", ".", ","]             # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
  end

  def isolate_known_message_pieces
    chars = message.chars
    known_chars = chars[-7..-1]
    @known_message = known_chars.join
  end

  def identify_rotation_positions
    case message.length % 4
    when 0
      @last_rotation = "d"
    when 1
      @last_rotation = "a"
    when 2
      @last_rotation = "b"
    else
      @last_rotation = "c"
    end
  end

  def pair_matching_rotations
    @rotation_map = [a_pair, b_pair, c_pair, d_pair]
    if last_rotation == "d"
      @rotation_map.rotate!(1)
      collect_rotation_pairs
    elsif last_rotation == "a"
      @rotation_map.rotate!(2)
      collect_rotation_pairs
    elsif last_rotation == "b"
      @rotation_map.rotate!(3)
      collect_rotation_pairs
    else
      collect_rotation_pairs
    end
  end

  def collect_rotation_pairs
    known_unencrypted_message = "..end..".chars
    @rotation_map[0] << known_message[4]
    @rotation_map[0] << known_unencrypted_message[4]
    @rotation_map[1] << known_message[5]
    @rotation_map[1] << known_unencrypted_message[5]
    @rotation_map[2] << known_message[6]
    @rotation_map[2] << known_unencrypted_message[6]
    @rotation_map[3] << known_message[3]
    @rotation_map[3] << known_unencrypted_message[3]
  end

  def find_rotation_difference(encrypted_letter, decrypted_letter)
    encrypted_stored_index = encryption_key.find_index(encrypted_letter)
    unencrypted_stored_index = encryption_key.find_index(decrypted_letter)
    difference = (encrypted_stored_index - unencrypted_stored_index)
  end

  def assign_decrypted_rotations
    pairs = [a_pair, b_pair, c_pair, d_pair]
    pairs.each do |first, second|
      encrypted_letter = first
      decrypted_letter = second
      @decrypted_rotations << find_rotation_difference(encrypted_letter, decrypted_letter)
    end
  end

  def crack_message
    isolate_known_message_pieces
    identify_rotation_positions
    pair_matching_rotations
    assign_decrypted_rotations
  end

  def decrypt_cracked_message
    d = Decryptor.new
    d.key.a = decrypted_rotations[0]
    d.key.b = decrypted_rotations[1]
    d.key.c = decrypted_rotations[2]
    d.key.d = decrypted_rotations[3]
    d.message = message
    d.decrypt_message
    @message = d.decrypted_message
  end

end

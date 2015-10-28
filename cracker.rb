require './key_generator'
require './encryptor'
require './decryptor'

class Cracker

  attr_accessor :message, :master_key, :date, :known_message, :last_rotation, :a_pair, :b_pair, :c_pair, :d_pair, :rotation_map

  def initialize(message=nil, master_key=nil, date=nil, known_message=nil, last_rotation=nil, a_pair=[], b_pair=[], c_pair=[], d_pair=[], rotation_map=[])
    @message = message
    @master_key = KeyGenerator.new(master_key)
    @date = @master_key.date
    @known_message = known_message
    @last_roation = last_rotation
    @a_pair = a_pair
    @b_pair = b_pair
    @c_pair = c_pair
    @d_pair = d_pair
    @rotation_map = rotation_map
  end

  def decryption_key
    encryption_key = ('a'..'z').to_a + ("0".."9").to_a + [" ", ".", ","]             # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    decryption_key = encryption_key.reverse!
  end

  def generate_date_offsets
    @master_key.generate_date
    @master_key.generate_date_offsets
    @date = @master_key.date
  end

  def isolate_known_message_pieces
    chars = @message.chars
    known_chars = chars[-7..-1]
    @known_message = known_chars.join
  end

  def identify_rotation_positions
    last_rotation = @message.length % 4
    if last_rotation == 0
      @last_rotation = "d"
    elsif last_rotation == 1
      @last_rotation = "a"
    elsif last_rotation == 2
      @last_rotation = "b"
    else
      @last_rotation = "a"
    end
  end

  def pair_matching_rotations
    @rotation_map = [@a_pair, @b_pair, @c_pair, @d_pair]
    if @last_rotation == "d"
      @rotation_map.rotate!(1)
      collect_rotation_pairs
    elsif @last_rotation == "c"
      @rotation_map.rotate!(2)
      collect_rotation_pairs
    elsif @last_rotation == "b"
      @rotation_map.rotate!(3)
      collect_rotation_pairs
    else
      collect_rotation_pairs
    end
  end

  def collect_rotation_pairs
    @rotation_map[0] << @known_message[0] + @known_message[4]
    @rotation_map[1] << @known_message[1] + @known_message[5]
    @rotation_map[2] << @known_message[2] + @known_message[6]
    @rotation_map[3] << @known_message[3]
  end

  






end

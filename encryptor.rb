require_relative 'enigma'
require_relative 'key_generator'

class Encryptor

  attr_accessor :message, :key, :encrypted_message, :wheel

  def initialize(message=nil, key=nil, encrypted_message=[])
    @message = message
    @key = KeyGenerator.new(12345)
    @encrypted_message = encrypted_message
  end

  def encryption_key
    encryption_key = ('a'..'z').to_a + ("0".."9").to_a + [" ", ".", ","]             # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
  end

  def find_rotation(letter)
    wheel_rotation
    stored_index = encryption_key.find_index(letter)
    total_rotation = ((@wheels[0] + stored_index) % 39)
    return total_rotation
  end

  def change_letter(letter)
    stored_letter = encryption_key.fetch(find_rotation(letter))
  end

  def encrypt_letter(letter)
    @encrypted_message << change_letter(letter)
  end

  def encrypt_message
    split_message
    @message.each do |letter|
      encrypt_letter(letter)
    end
    @encrypted_message = @encrypted_message.join("")
  end

  def wheel_rotation
      @wheels = [@key.a, @key.b, @key.c, @key.d]
  end

  def split_message
    @message = @message.chars
  end
end

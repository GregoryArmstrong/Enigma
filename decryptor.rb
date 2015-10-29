require './key_generator'
require './enigma'


class Decryptor

  attr_accessor :message, :key, :decrypted_message, :wheels

  def initialize(message=nil, key=nil)
    @message = message
    kg = KeyGenerator.new(12345)
    @key = kg
    @decrypted_message = []
    @wheels = []
  end

  def decryption_key
    encryption_key = ('a'..'z').to_a + ("0".."9").to_a + [" ", ".", ","]             # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    decryption_key = encryption_key.reverse!
  end

  def find_rotation(letter)
    stored_index = decryption_key.find_index(letter)
    total_rotation = ((@wheels[0] + stored_index) % 39)
  end

  def change_letter(letter)
    stored_letter = decryption_key.fetch(find_rotation(letter))
  end

  def decrypt_letter(letter)
    @decrypted_message << change_letter(letter)
  end

  def decrypt_message
    assign_wheels
    @message.chars.each do |letter|
      decrypt_letter(letter)
      @wheels.rotate!
    end
    @decrypted_message = @decrypted_message.join("")
  end

  def assign_wheels
      @wheels = [@key.a, @key.b, @key.c, @key.d]
  end
end

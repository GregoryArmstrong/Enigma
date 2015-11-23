require_relative 'enigma'
require_relative 'key_generator'

class Encryptor

  attr_accessor :message, :key, :encrypted_message, :wheels

  def initialize(message=nil, key=12345, date=nil)
    @message = message
    @key = KeyGenerator.new(key, date)
    @encrypted_message = []
    @wheels = []
  end

  def encryption_key
    encryption_key = ('a'..'z').to_a + ("0".."9").to_a + [" ", ".", ","]             # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
  end

  def find_rotation(letter)
    stored_index = encryption_key.find_index(letter.downcase)
    total_rotation = ((wheels[0] + stored_index) % 39)
  end

  def change_letter(letter)
    stored_letter = encryption_key.fetch(find_rotation(letter))
  end

  def encrypt_letter(letter)
    @encrypted_message << change_letter(letter)
  end

  def encrypt_message
    assign_wheels
    message.chars.each do |letter|
      encrypt_letter(letter)
      @wheels.rotate!
    end
    @encrypted_message = encrypted_message.join("")
  end

  def assign_wheels
      @wheels = [key.a, key.b, key.c, key.d]
  end
end

require '../lib/key_generator'
require '../lib/enigma'


class Decryptor

  attr_accessor :message, :key, :decrypted_message, :wheels

  def initialize(message=nil, key=12345, date=nil)
    @message = message
    @key = KeyGenerator.new(key, date)
    @decrypted_message = []
  end

  def decryption_key
    decryption_key = (('a'..'z').to_a + ("0".."9").to_a + [" ", ".", ","]).reverse!             # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
  end

  def find_rotation(letter)
    stored_index = decryption_key.find_index(letter)
    ((wheels[0] + stored_index) % 39)
  end

  def change_letter(letter)
    decryption_key.fetch(find_rotation(letter))
  end

  def decrypt_letter(letter)
    @decrypted_message.push(change_letter(letter))
  end

  def decrypt_message
    @wheels = [key.a, key.b, key.c, key.d]
    message.chars.each do |letter|
      decrypt_letter(letter)
      wheels.rotate!
    end
    @decrypted_message = decrypted_message.join("")
  end

end

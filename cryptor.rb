module Cryptor
  attr_accessor :crypted_message, :message, :key, :wheels

  def base_key
    ('a'..'z').to_a + ("0".."9").to_a + [" ", ".", ","]
  end

  def find_rotation(letter)
    stored_index = base_key.find_index(letter)
    total_rotation = ((@wheels[0] + stored_index) % 39)
  end

  def change_letter(letter)
    stored_letter = base_key.fetch(find_rotation(letter))
  end

  def crypt_letter(letter)
    @crypted_message << change_letter(letter)
  end

  def crypt_message
    @message.chars.each do |letter|
      crypt_letter(letter)
      @wheels.rotate!
    end
    @crypted_message.join("")
  end

  def assign_wheels
    @wheels = [@key.a, @key.b, @key.c, @key.d]
  end
end
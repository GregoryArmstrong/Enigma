require_relative 'key_generator'
require_relative 'offset_generator'

class Enigma

  attr_accessor :message, :master_key, :date, :a, :b, :c, :d

  # ENCRYPTION_KEY = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
    # "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", " ", ","]
  def initialize(message=nil, master_key=nil, date=nil, a=nil, b=nil, c=nil, d=nil)

  end

  def encrypt
    kg = KeyGenerator.new(12345)
    kg.generate_all
    @master_key = kg.key
    @a = kg.a
    @b = kg.b
    @c = kg.c
    @d = kg.d
    @date = kg.date
  end

  def decrypt(message=nil, key=nil, date=nil)

  end

  def crack(message=nil, date=nil)

  end

end

class Encryptor < Enigma

  def initialize
    super master_key

  end

end

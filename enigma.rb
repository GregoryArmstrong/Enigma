require_relative 'key_generator'
require_relative 'offset_generator'

class Enigma

  attr_accessor :message, :master_key, :date, :a, :b, :c, :d

  def encrypt(message=nil, master_key=nil, date=nil, a=nil, b=nil, c=nil, d=nil)
    kg = KeyGenerator.new(12345)
    # kg.generate_key
    kg.generate_key_offsets
    kg.generate_date
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

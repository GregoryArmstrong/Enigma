require './enigma'
require './key_generator'

class OffsetGenerator

  attr_accessor :key, :a, :b, :c, :d

  def initialize(key=nil, a=nil, b=nil, c=nil, d=nil)
    @key = key
    @a = a
    @b = b
    @c = c
    @d = d
  end

  def import_key
    @key = @master_key
  end





end

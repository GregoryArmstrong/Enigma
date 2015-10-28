require 'date'

class KeyGenerator
  attr_accessor :key, :a, :b, :c, :d, :date

  def initialize(key=12345, a=nil, b=nil, c=nil, d=nil, date=nil)
    @key = key
    @a = a
    @b = b
    @c = c
    @d = d
    @date = date
    generate_all
  end

  def generate_all
    # generate_key
    generate_key_offsets
    generate_date
    generate_date_offsets
    generate_final_offsets
  end

  def generate_key
    @key = rand(10000..99999)
  end

  def generate_date
    d = Date.today
    @date = d.strftime("%d/%m/%Y")
  end

  def generate_key_offsets
    a_key_offset
    b_key_offset
    c_key_offset
    d_key_offset
  end

  def generate_date_offsets
    date_offset = @date[0] + @date[1] + @date[3] + @date[4] + @date[8] + @date[9]
    squared_date = date_offset.to_i * date_offset.to_i
    squared_date_offsets = squared_date.to_s[-4..-1]
    @date = squared_date_offsets
  end

  def generate_final_offsets
    @a = @a + @date[0].to_i
    @b = @b + @date[1].to_i
    @c = @c + @date[2].to_i
    @d = @d + @date[3].to_i
  end

  def a_key_offset
    @a = @key.to_s[0] + @key.to_s[1]
    @a = @a.to_i
  end

  def b_key_offset
    @b = @key.to_s[1] + @key.to_s[2]
    @b = @b.to_i
  end

  def c_key_offset
    @c = @key.to_s[2] + @key.to_s[3]
    @c = @c.to_i
  end

  def d_key_offset
    @d = @key.to_s[3] + @key.to_s[4]
    @d = @d.to_i
  end
end

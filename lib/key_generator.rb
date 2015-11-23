require 'date'
require 'pry'

class KeyGenerator
  attr_accessor :key, :a, :b, :c, :d, :date

  def initialize(key=12345, date=nil)
    @key = key
    @a = a
    @b = b
    @c = c
    @d = d
    @date = date
  end

  def generate_all
    generate_date
    generate_date_offsets
    generate_final_offsets
  end

  def generate_key
    @key = rand(10000..99999)
  end

  def generate_date
    if date.nil?
      d = Date.today
      @date = d.strftime("%d/%m/%Y")
    elsif date.class == Date
      @date = date.strftime("%d/%m/%Y")
    else
      @date
    end
  end

  def generate_date_offsets
    date_offset = (date[0] + date[1] + date[3] + date[4] + date[8] + date[9]).to_i
    @date = (date_offset * date_offset).to_s[-4..-1]
  end

  def generate_final_offsets
    @a = a_key_offset + date[0].to_i
    @b = b_key_offset + date[1].to_i
    @c = c_key_offset + date[2].to_i
    @d = d_key_offset + date[3].to_i
  end

  def a_key_offset
    @a = (key.to_s[0] + key.to_s[1]).to_i
  end

  def b_key_offset
    @b = (key.to_s[1] + key.to_s[2]).to_i
  end

  def c_key_offset
    @c = (key.to_s[2] + key.to_s[3]).to_i
  end

  def d_key_offset
    @d = (key.to_s[3] + key.to_s[4]).to_i
  end
end

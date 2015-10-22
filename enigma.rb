require_relative 'key_generator'
require_relative 'offset_generator'
require_relative 'encryptor'

class Enigma

  attr_accessor :message, :key, :date

  def encrypt(message=nil, key=nil, date=nil)
    kg = KeyGenerator.new
    kg.generate_key
    @key  = kg.key

  end

  def decrypt(message=nil, key=nil, date=nil)

  end

  def crack(message=nil, date=nil)

  end









end

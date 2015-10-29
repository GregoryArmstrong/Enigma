require_relative 'key_generator'
require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'cracker'
require 'pry'  # => true

class Enigma

  attr_accessor :message, :master_key, :date  # => nil

  def initialize(message=nil, master_key=nil, date=nil)
    @message = message
    @master_key = master_key
    @date = date
  end

  def encrypt(message=nil, key=nil, date=nil)
    e = Encryptor.new
    e.message = @message || message
    e.key.key = @master_key || key
    e.key.generate_all
    e.encrypt_message
  end

  def decrypt(message=nil, key=nil, date=nil)
    d = Decryptor.new
    d.message = @message || message
    d.key.key = @master_key || key
    d.key.generate_all
    d.decrypt_message
  end

  def crack(message=nil, date=nil)
    c = Cracker.new
    c.message = @message || message
    c.crack_message
    c.decrypt_cracked_message
  end

end

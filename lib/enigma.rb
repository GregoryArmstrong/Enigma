require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'cracker'
require 'pry'

class Enigma

  attr_reader :initialized_message, :master_key, :date, :encryptor, :decryptor, :cracker  # => nil

  def initialize(message=nil, master_key=nil, date=nil)
    @initialized_message = message
    @master_key = master_key
    @date = date
  end

  def encrypt(message=nil, key=nil, date=nil)
    @encryptor = Encryptor.new(message, key, date)
    encryptor.message = initialized_message || message
    key_setter(encryptor, master_key, key)
    encryptor.encrypt_message
  end

  def decrypt(message=nil, key=nil, date=nil)
    @decryptor = Decryptor.new(message, key, date)
    decryptor.message = initialized_message || message
    key_setter(decryptor, master_key, key)
    decryptor.decrypt_message
  end

  def crack(message=nil, date=nil)
    @cracker = Cracker.new
    cracker.message = initialized_message || message
    cracker.crack_message
    cracker.decrypt_cracked_message
  end

  def key_setter(object, master_key, key)
    if key.nil? && !master_key.nil?
      object.key.key = master_key
      object.key.generate_all
    elsif master_key.nil? && !key.nil?
      object.key.key = key
      object.key.generate_all
    else
      object.key.key = 12345
      object.key.generate_all
    end
  end

end

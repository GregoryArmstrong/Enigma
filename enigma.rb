require_relative 'key_generator'
require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'cracker'  # => true

class Enigma

  attr_accessor :message, :master_key, :date  # => nil

  def initialize(message=nil, master_key=nil, date=nil)
    @message = message
    @master_key = master_key
    @date = date
  end

  def encrypt
    e = Encryptor.new
    e.message = @message
    e.key.key = @master_key
    e.key.generate_all
    e.encrypt_message
  end

  def decrypt(message=nil, key=nil, date=nil)
    d = Decryptor.new
    d.message = message
    d.key = key
    d.decrypt_message
  end

  def crack(message=nil, date=nil)

  end

end

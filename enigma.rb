require_relative 'key_generator'
require_relative 'encryptor'  # => true

class Enigma

  attr_accessor :message, :master_key, :date  # => nil

  def initialize(message=nil, master_key=nil, date=nil)
    @message = message
    @master_key = master_key
    @date = date
  end

  def encrypt

  end

  def decrypt(message=nil, key=nil, date=nil)

  end

  def crack(message=nil, date=nil)

  end

end

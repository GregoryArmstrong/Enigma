require './cryptor'
require './enigma'
require './key_generator'

class Decryptor
  include Cryptor

  attr_accessor :decrypted_message

  def initialize(message=nil, key=12345)
    @key = KeyGenerator.new(key)
    @wheels = assign_wheels
    @message = message
    @crypted_message = []
  end

  def base_key
    super.reverse!
  end

  def decrypt_message
    @decrypted_message = crypt_message
  end
end

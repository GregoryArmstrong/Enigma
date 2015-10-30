require './cryptor'
require './enigma'
require './key_generator'

class Encryptor
  include Cryptor

  attr_accessor :encrypted_message

  def initialize(message=nil, key=12345)
    @key = KeyGenerator.new(key)
    @wheels = assign_wheels
    @message = message
    @crypted_message = []
  end

  def encrypt_message
    @encrypted_message = crypt_message
  end
end

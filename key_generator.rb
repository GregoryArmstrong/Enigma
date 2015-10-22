class KeyGenerator

  def initialize(key=nil)
    @key = key
  end

  def key
    @key
  end

  def generate_key
    @link = rand(10000..99999)
  end

end

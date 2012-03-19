class String
  def self.random(length=10)
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ'
    random_guff = ''
    length.times { |i| random_guff << chars[rand(chars.length)] }
    random_guff
  end
end

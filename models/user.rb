require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id,         Serial
  property :email,      String
  property :password_digest,   String, length: 60

  validates_confirmation_of :password

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

end

require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,         Serial
  property :email,      String
  property :password,   String, length: 60
  property :password_confirmation,   String, length: 60

end

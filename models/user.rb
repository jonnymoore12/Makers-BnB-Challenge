require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id,         Serial
  property :email,      String, required: true
  property :password_digest,   String, length: 60, required: true

  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_format_of :email, as: :email_address
  validates_presence_of :password, :password_confirmation


  has n, :spaces, :child_key => [:host_id]
  has n, :requests_sent,   'Request',  :child_key => [ :guest_id ]
  has n, :requests_received, 'Request',:child_key => [ :host_id ]

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def self.authenticate(email, password)
    user = first(email: email)

    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end

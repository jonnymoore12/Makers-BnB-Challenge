class Space
  include DataMapper::Resource

  property :id,              Serial
  property :name,            String, required: true
  property :description,     String
  property :price,           Float, required: true
  property :available_from,  Time, required: true
  property :available_to,    Time, required: true

  belongs_to :user
  has n, :requests

end

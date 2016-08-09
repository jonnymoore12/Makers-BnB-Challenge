class Space
  include DataMapper::Resource

  property :id,              Serial
  property :name,            String
  property :description,     String
  property :price,           Float
  property :available_from,  Time
  property :available_to,    Time

end

class Request
  include DataMapper::Resource

  property :id,       Serial
  property :status,   String
  property :date,     Date

  belongs_to :guest, 'User', :key => true
  belongs_to :host,  'User', :key => true
  belongs_to :space, 'Space',:key => true
end

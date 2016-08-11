class Request
  include DataMapper::Resource

  property :id,       Serial
  property :status,   String
  property :date,     Time, required: true

  belongs_to :guest, 'User'
  belongs_to :host,  'User'
  belongs_to :space, 'Space'
end

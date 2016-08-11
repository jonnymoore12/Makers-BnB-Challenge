class Request
  include DataMapper::Resource

  property :id,       Serial
  property :status,   String
  property :date,     Time, required: true

  # validates_with_method :guest, method: :is_guest?
  #
  # def is_guest?
  #   if space.user == @guest
  #     [false, "You can't book your own space"]
  #   else
  #     true
  #   end
  # end


  belongs_to :guest, 'User', :key => true
  belongs_to :host,  'User', :key => true
  belongs_to :space, 'Space',:key => true
end

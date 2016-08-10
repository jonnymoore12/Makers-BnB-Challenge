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

  validates_with_method :available_from,
                          :method => :in_the_past?

  def in_the_past?
    if @available_from.to_s >= Time.now.to_s
      return true
    else
      return [false, "Space cannot be available in the past"]
    end
  end

end

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
                        :method => :check_available_from
  validates_with_method :available_to, :method => :check_available_to

  validates_with_method :available_to,
                        :method => :positive_duration

  def positive_duration
    if @available_to > @available_from
      return true
    else
      return [false, "Space cannot be available for negative duration"]
    end
  end

  def check_available_from
    in_the_past?(@available_from)
  end

  def check_available_to
    in_the_past?(@available_to)
  end

  private

  def in_the_past?(date)
    if date == ""
      return true
    elsif date.strftime("%d/%m/%Y") >= Time.now.strftime("%d/%m/%Y")
      return true
    else
      return [false, "Space cannot be available in the past"]
    end
  end

end

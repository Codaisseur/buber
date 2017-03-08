class Spacetaxi
  attr_accessor :color, :form, :taxi_number, :available

  def initialize(color, form, taxi_number, available = true)
    @color = color
    @form = form
    @taxi_number = taxi_number
    @available = available
  end
end

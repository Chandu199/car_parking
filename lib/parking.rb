class Parking
  attr_accessor :slot_size

  def initialize slots = nil
    @slots = []
  end

  def create slot_size
    slot_size.times do |slot|
      @slots << default_value(slot)
    end
    return @slots
  end

  private
  def default_value(id)
    slots = {slot_id: (id+1), car_id: nil, car_color: nil, empty: true }
  end

end

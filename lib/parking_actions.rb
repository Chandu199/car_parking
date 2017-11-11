require './parking'
require './car'

class ParkingActions
  attr_accessor :slots, :car

  def initialize slots = nil, car = nil
    @slots = slots
    @car = car
  end

  def create_parking_space slot_size
    @slots = Parking.new.create(slot_size)
  end

  def park_car(number, color)
    slot = @slots.find(empty: true).first
    car = Car.new(number, color)

    slot[:car_id] = car.car_number
    slot[:car_color] = car.car_color
    slot[:empty] = false
    p slot
  end

  def status
    headings = @slots.map(&:keys)[0]
    headings.each do |heading|
      print "#{heading.to_s.gsub("_", " ").capitalize} \t"
    end
    puts "\n ----------------------------------------------------------"
    values = @slots.map(&:values)
    values.each do |subvalues|
      subvalues.each do |value|
        print "#{value} \t"
      end
      puts "\n ----------------------------------------------------------"
    end
  end

  def leave slot_id
    slot = @slots.find(slot_id)
    slot[:car_number], slot[:car_color], slot[:empty] = nil, nil, true
  end

end

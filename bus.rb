class Bus

  attr_reader :number, :destination
  attr_accessor :passengers

  def initialize(number, destination, passengers)
    @number = number
    @destination = destination
    @passengers = passengers
  end

  def drive
    return "Brum brum"
  end

  def passenger_count()
    @passengers.count
  end

  def pick_up(passenger)
    @passengers.push(passenger)
  end

  def drop_off(passenger)
    for person in @passengers
      if person == passenger
        @passengers.delete(person)
      end
    end
  end

  def empty
    @passengers.clear
  end

  def pick_up_from_stop(bus_stop)
    for passenger in bus_stop.queue
      @passengers.push(passenger)
    end
    bus_stop.queue.clear
  end

end

class Bus

  attr_reader :number, :destination

  def initialize(number, destination)
    @number = number
    @destination = destination
    @passengers = [] # add here rather than as param, if initializing empty
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

  # def pick_up_from_stop(bus_stop)
  #   for passenger in bus_stop.queue
  #     @passengers.push(passenger)
  #   end
  #   bus_stop.queue.clear
  # end

  # USE A COPY TO USE, THEN CALL ON BUS STOP TO CLEAR ITS OWN DATA
  def pick_up_from_stop(bus_stop)
    for passenger in bus_stop.get_queue_copy()
      pick_up(passenger)
    end
    bus_stop.clear_queue # the bus stop is responsible for doing this
  end
end

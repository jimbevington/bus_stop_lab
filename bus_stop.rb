class BusStop

  attr_reader :name, :queue

  def initialize(name)
    @name = name
    @queue = []
  end

  def add_to_queue(passenger)
    @queue.push(passenger)
  end
  # create a copy of the data that the bus can access
  def get_queue_copy()
    copy = @queue
    return copy
  end
  # do this here so the bus can't clear the queue
  def clear_queue()
    @queue.clear()
  end

end

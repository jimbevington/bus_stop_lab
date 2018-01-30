class BusStop

  attr_reader :name, :queue

  def initialize(name, queue)
    @name = name
    @queue = queue
  end

  def add_to_queue(passenger)
    @queue.push(passenger)
  end

end

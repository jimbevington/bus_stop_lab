require('minitest/autorun')
require('minitest/rg')

require_relative('../bus_stop.rb')
require_relative('../bus.rb')
require_relative('../person.rb')

class BusStopTest < MiniTest::Test

  def setup

    @passenger1 = Person.new("Etheldred", 105)
    @passenger2 = Person.new("Utha", 156)

    @bus = Bus.new(3, "Hampden Park", [])

    @bus_stop1 = BusStop.new("Ambrosia", [])
    @bus_stop2 = BusStop.new("Waldorf Hotel", [@passenger1, @passenger2])

  end

  def test_bus_stop_name
    assert_equal("Ambrosia", @bus_stop1.name)
  end

  def test_bus_stop_queue
    assert_equal([], @bus_stop1.queue)
  end

  def test_bus_stop_add_to_queue
    @bus_stop1.add_to_queue(@passenger1)
    assert_equal([@passenger1], @bus_stop1.queue)
  end

  def test_bus_stop_bus_picked_up_passengers
    @bus.pick_up_from_stop(@bus_stop2) # bus picks up all passengers
    assert_equal([], @bus_stop2.queue) # empty array
    assert_equal(0, @bus_stop2.queue.count) # definitely empty
  end

end

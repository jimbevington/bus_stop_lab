require('minitest/autorun')
require('minitest/rg')

require_relative('../bus.rb')
require_relative('../person.rb')
require_relative('../bus_stop.rb')

class BusTest < MiniTest::Test

  def setup
    @passenger1 = Person.new("Jim", 28)
    @passenger2 = Person.new("Sam", 30)

    @bus = Bus.new(62, "Maryhill Road")

    @bus_stop = BusStop.new("Croxley St")
  end

  def test_bus_number
    assert_equal(62, @bus.number)
  end

  def test_bus_destination
    assert_equal("Maryhill Road", @bus.destination)
  end

  def test__bus_drive
    assert_equal("Brum brum", @bus.drive)
  end

  def test_number_of_passengers__none
    assert_equal(0, @bus.passenger_count)
  end

  def test_pick_up
    @bus.pick_up(@passenger1)
    # new_passenger = @bus.passengers
    # assert_equal([@passenger1], new_passenger)
    assert_equal(1, @bus.passenger_count)
  end

  def test_can_drop_off
    @bus.pick_up(@passenger1)
    @bus.drop_off(@passenger1)
    assert_equal(0, @bus.passenger_count)
  end

  def test_empty
    @bus.pick_up(@passenger1)
    @bus.pick_up(@passenger2)
    @bus.empty
    assert_equal(0, @bus.passenger_count)
  end

  def test_pick_up_from_stop
    @bus_stop.add_to_queue(@passenger1)
    @bus_stop.add_to_queue(@passenger2)
    @bus.pick_up_from_stop(@bus_stop)
    assert_equal(2, @bus.passenger_count) # there are 3 passengers
    assert_equal([], @bus_stop.queue) # bus stop queue now empty
  end

end

require('minitest/autorun')
require('minitest/rg')

require_relative('../bus.rb')
require_relative('../person.rb')
require_relative('../bus_stop.rb')

class BusTest < MiniTest::Test

  def setup
    @passenger1 = Person.new("Jim", 28)
    @passenger2 = Person.new("Sam", 30)
    @passenger3 = Person.new("Oskar", 0)

    @empty_bus = Bus.new(62, "Maryhill Road", [])
    @full_bus = Bus.new(189, "Brigadoon", [@passenger1, @passenger2])

    @bus_stop = BusStop.new("Croxley St", [@passenger1, @passenger2, @passenger3])
  end

  def test_bus_number
    assert_equal(62, @empty_bus.number)
  end

  def test_bus_destination
    assert_equal("Maryhill Road", @empty_bus.destination)
  end

  def test_drive
    assert_equal("Brum brum", @empty_bus.drive)
  end

  def test_passengers
    assert_equal([], @empty_bus.passengers)
  end

  def test_number_of_passengers__none
    assert_equal(0, @empty_bus.passenger_count)
  end

  def test_number_of_passengers__one
    new_bus = Bus.new(76, "Hell", [@passenger1])
    assert_equal(1, new_bus.passenger_count)
  end

  def test_pick_up
    @empty_bus.pick_up(@passenger1)
    new_passenger = @empty_bus.passengers
    assert_equal([@passenger1], new_passenger)
    assert_equal(1, @empty_bus.passenger_count)
  end

  def test_drop_off
    @full_bus.drop_off(@passenger1)
    assert_equal([@passenger2], @full_bus.passengers)
    assert_equal(1, @full_bus.passenger_count)
  end

  def test_empty
    @full_bus.empty
    assert_equal([], @full_bus.passengers)
    assert_equal(0, @full_bus.passenger_count)
  end

  def test_pick_up_from_stop
    @empty_bus.pick_up_from_stop(@bus_stop)
    passenger_names = [@passenger1, @passenger2, @passenger3]
    assert_equal(3, @empty_bus.passenger_count) # there are 3 passengers
    assert_equal(passenger_names, @empty_bus.passengers) # correct passengers
    assert_equal([], @bus_stop.queue) # bus stop queue now empty
  end

end

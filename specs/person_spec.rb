require('minitest/autorun')
require('minitest/rg')

require_relative('../person.rb')

class PersonTest < MiniTest::Test

  def setup
    @person = Person.new("Jim", 28)
  end

  def test_person_name
    assert_equal("Jim", @person.name)
  end

  def test_person_age
    assert_equal(28, @person.age)
  end

end

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  setup do 
    @person = people(:one)
  end

  test 'should not be valid without first name' do 
    @person.first_name = nil
    assert @person.valid? == false
    assert_includes @person.errors.messages.values.flatten, "can't be blank"
  end

  test 'should not be valid without email' do 
    @person.email = nil
    assert @person.valid? == false
    assert_includes @person.errors.messages.values.flatten, "can't be blank"
  end

  test 'should not be valid with a wrong email' do 
    @person.email = "pepito@example"
    assert @person.valid? == false
    assert_includes @person.errors.messages.values.flatten, "must be a valid email"
  end

  test 'should return a full name with first and last' do 
    assert_equal @person.full_name, "Rodolfo Lunares"
  end

  test 'should return a specific age' do 
    assert_equal @person.age, 25
  end

  test 'should not be valid with a future birthdate' do 
    @person.birthdate = Date.today + 2.years
    assert @person.valid? == false
    assert_includes @person.errors.messages.values.flatten, "can't be in the future"
  end
end

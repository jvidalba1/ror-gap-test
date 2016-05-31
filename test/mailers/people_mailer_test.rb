require 'test_helper'

class PeopleMailerTest < ActionMailer::TestCase
  setup do
    @from = people(:one)
    @target = people(:two)
  end

  test "should send a email when a person is created" do
    mail = PeopleMailer.person_created(@from.full_name, @target.id)
    assert_equal "People App - New person added", mail.subject
  end

  test "should send a email when a person is deleted" do
    mail = PeopleMailer.person_deleted(@from.full_name, @target.id)
    assert_equal "People App - Person destroyed", mail.subject
  end
end

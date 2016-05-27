class PeopleMailer < ApplicationMailer
  def person_created(id)
    @person = Person.find(id)
    mail to: @person.email
  end

  def person_deleted(id)
    @person = Person.find(id)
    mail to: @person.email
  end
end

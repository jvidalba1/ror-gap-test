class PeopleMailer < ApplicationMailer
  def person_created(full_name, recipient_id)
    @full_name_joined = full_name
    @person = Person.find(recipient_id)
    mail to: @person.email, subject: "People App - New person added"
  end

  def person_deleted(full_name, recipient_id)
    @full_name_destroyed = full_name
    @person = Person.find(recipient_id)
    mail to: @person.email, subject: "People App - Person destroyed"
  end
end

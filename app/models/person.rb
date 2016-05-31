class Person < ActiveRecord::Base
  
  mount_uploader :picture, PictureUploader

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, presence: true, length: { :maximum => 75 }
  validates :last_name, presence: true, length: { :maximum => 75 }
  validates :email, presence: true, uniqueness: true, :length => { :maximum => 75 }, format: { with: EMAIL_REGEX, message: "must be a valid email" }
  validates :job, allow_blank: true, length: { maximum: 75 }
  validates :gender, presence: true, inclusion: { in: ["Male", "Female"] }
  validates :birthdate, presence: true
  validate :birthdate_cannot_be_in_the_future

  enum gender: { "Male" => "Male", "Female" => "Female" }

  after_create :person_created_email
  after_destroy :person_deleted_email

  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    now = DateTime.now
    now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
  end

  def birthdate_cannot_be_in_the_future
    if (birthdate.present?) && (birthdate > Date.today)
      errors.add(:birthdate, "can't be in the future")
    end
  end

  def person_created_email
    people = Person.where("id != ?", self.id)
    people.each { |person| PeopleMailer.person_created(self.full_name, person.id).deliver_later }
  end

  def person_deleted_email
    people = Person.where("id != ?", self.id)
    people.each { |person| PeopleMailer.person_deleted(self.full_name, person.id).deliver_later }
  end
end

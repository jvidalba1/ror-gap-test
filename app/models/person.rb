class Person < ActiveRecord::Base
  
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, presence: true, length: { :maximum => 75 }
  validates :last_name, presence: true, length: { :maximum => 75 }
  validates :email, presence: true, uniqueness: true, :length => { :maximum => 75 }, format: { with: EMAIL_REGEX, message: "must be a valid email" }
  validates :job, allow_blank: true, length: { maximum: 75 }
  validates :gender, presence: true, inclusion: { in: %w(Male Female) }
  validates :birthdate, presence: true
  validate :birthdate_cannot_be_in_the_future

  enum gender: ["Male", "Female"]

  def birthdate_cannot_be_in_the_future
    if (birthdate.present?) && (birthdate > Date.today)
      errors.add(:birthdate, "can't be in the future")
    end
  end
end

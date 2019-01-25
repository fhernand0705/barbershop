class User < ApplicationRecord
  before_save {self.email = email.downcase}

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, :uniqueness => {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 4}

  has_secure_password

  has_many :appointments
  has_many :shops, through: :appointments
  has_many :schedules

  def full_name
    self.first_name + ' ' + self.last_name
  end
end

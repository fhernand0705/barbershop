class User < ApplicationRecord
  # rolify

  before_save {self.email = email.downcase}

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
  validates :password, presence: true, length: {minimum: 4}

  has_many :appointments
  has_many :shops, through: :appointments
  has_many :schedules

  def full_name
    self.first_name + ' ' + self.last_name
  end
end

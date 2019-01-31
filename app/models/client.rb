class Client < ApplicationRecord

  before_save {self.email = email.downcase}

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
  validates :password, presence: true, length: {minimum: 4}

  has_many :appointments, dependent: :destroy
  has_many :schedules
  belongs_to :shop, optional: true

  def full_name
    self.first_name + ' ' + self.last_name
  end
end

class Shop < ApplicationRecord
  has_many :appointments
  has_many :users

  validates :name, presence: true
  validates :address, presence: true

end

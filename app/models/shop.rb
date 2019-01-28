class Shop < ApplicationRecord
  has_many :appointments
  has_many :user, through: :appointments
end

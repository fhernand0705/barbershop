class Shop < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :users

  validates :name, presence: true
  validates :address, presence: true

  # resourcify
end

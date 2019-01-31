class Schedule < ApplicationRecord
  belongs_to :user
  has_many :appointments

  validates :start_at, presence: true
  validates :end_at, presence: true

end

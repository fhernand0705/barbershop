class Appointment < ApplicationRecord
  belongs_to :user, optional: true, dependent: :destroy
  belongs_to :shop, optional: true, dependent: :destroy
  belongs_to :service, optional: true
  belongs_to :schedule, optional: true

  validates :start_at, presence: true
  validates :user_id, presence: true
  validates :shop_id, presence: true

  def start_time
    self.start_date
  end

  # resourcify
end

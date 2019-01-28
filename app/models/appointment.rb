class Appointment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :shop, optional: true
  belongs_to :service, optional: true
  belongs_to :schedule, optional: true

  # resourcify 
end

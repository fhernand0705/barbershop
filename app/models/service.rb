class Service < ApplicationRecord
  has_many :appointments

  # resourcify 

  def service_price
    self.name + ' ' + '$' + self.price.to_s
  end
end

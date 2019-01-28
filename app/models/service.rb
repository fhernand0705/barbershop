class Service < ApplicationRecord
  has_many :appointments

  def service_price
    self.name + ' ' + '$' + self.price.to_s
  end
end

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum production_status:{cannot_start: 0, witing_for_production: 1, in_production: 2,completion_of_production:3}
end

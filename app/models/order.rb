class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  validates :payment_method, presence: true



  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { wait: 0, confirmation: 1, make: 2, ready: 3, shipping: 4 }
end

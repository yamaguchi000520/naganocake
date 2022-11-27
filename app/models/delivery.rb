class Delivery < ApplicationRecord
  belongs_to :customer
  validates :name, presence: true
  validates :zip, presence: true
  validates :address, presence: true

  def address_display
  '〒' + zip + ' ' + address + ' ' + name
  end

end

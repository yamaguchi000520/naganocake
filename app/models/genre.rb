class Genre < ApplicationRecord
  has_many :products
  validates :name, presence: true, uniqueness: true
  validates :email, presence: false

end

class Product < ApplicationRecord

  belongs_to:genre
  has_many:cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  Genre.select(:name)
  has_one_attached :image
  validates:name,presence: true,length: { minimum: 1, maximum: 20 }
  validates:explanation, presence: true,length: { minimum: 1, maximum: 200 }
  validates:price,presence: true

  def add_tax_price
        (self.price * 1.08).round
  end

  def get_image(width,height)
    if image.attached?
      image.variant(resize_to_limit: [width, height]).processed
    else
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
    end
  end

end

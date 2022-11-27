class Public::ProductsController < ApplicationController
  
  def index
    @products=Product.all
    @genres=Genre.all
  end
  
  def show
    @product=Product.find(params[:id])
    @cart_item=CartItem.new
    @genres=Genre.all
  end
  
  
  
  private
  
  def product_params
    params.require(:product).permit(:genre_id,:name,:price,:explanation,:is_active,:image)
  end
end

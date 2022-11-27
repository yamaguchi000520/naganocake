class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin! 
 def new
    @product=Product.new
    @genres=Genre.all
 end

 def create
   @product=Product.new(product_params)
   #binding.pry
   if @product.save
    flash[:notice]="商品の登録が完了しました"
    redirect_to admin_product_path(@product.id)
   else
   flash[:danger]="未入力項目があります"
   @genres=Genre.all
   @product=Product.new(product_params)
    render 'new'
   end
 end
  
 def show
    @product=Product.find(params[:id])
    @genre=@product.genre
 end  
 
 def update
    @product=Product.find(params[:id])
    @product.update(product_params)
    flash[:notice]="商品の編集が完了しました"
    redirect_to admin_product_path(@product.id)
 end
  
 def edit
    @product=Product.find(params[:id])
    @genres=Genre.all
 end
 
 def index
  @products=Product.all
  @product=Product
 end
  
  
  
  private
  
  def product_params
    params.require(:product).permit(:genre_id,:name,:price,:explanation,:is_active,:image)
  end
end

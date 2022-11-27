class Public::OrdersController < ApplicationController

  def new
    @address = current_customer.address
    @order = Order.new
    @cart_items = CartItem.all
  end


  def confirm
    @order = Order.new(order_params)
    @new_order=Order.new
    @cart_items = current_customer.cart_items.all
    @order.status=0
    if params[:order][:select_address] == "1" #自分の住所が選択された場合
      @order.zip = current_customer.zip
      @order.address = current_customer.address
      @order.name = current_customer.last_name + " " + current_customer.first_name
    elsif params[:order][:select_address] == "2" #配送先の住所が選択された場合
      delivery = Delivery.find(params[:order][:delivery_id])
      @order.zip = delivery.zip
      @order.address = delivery.address
      @order.name = delivery.name
    elsif params[:order][:select_address] == "3" #新規住所作成が選択された場合
      @order.zip = params[:order][:delivery_zip]
      @order.address = params[:order][:delivery_address]
      @order.name = params[:order][:delivery_name]
    else
      flash[:notice]="未入力の情報があります"
      render 'new'
    end
    # @address = Address.find(params[:order][:address_id])
    # @order.zip = @address.zip
    # @order.address = @address.address
    # @order.name = @address.name

  end

  def thanks
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    current_customer.cart_items.each do |cart_item|
      @ordered_item = OrderItem.new
      @ordered_item.order_id = @order.id
      @ordered_item.product_id =  cart_item.product_id
      @ordered_item.product_count = cart_item.product_count
      @ordered_item.price = cart_item.product.price
      @ordered_item.production_status=0
      @ordered_item.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_thanks_path
    if params[:order][:select_address] == "3"
      current_customer.delivery_address.create(address_params)
    end
  end

  def index
   @orders = current_customer.orders
  end

  def show
   @order = Order.find(params[:id])
   @order_items = @order.order_items
  end

  private
  def order_params

    params.require(:order).permit( :name, :zip, :address,:total_price,:postage,:payment_method, :status)

  end

  def address_params
    params.require(:order).permit(:zip, :adderss, :name)
  end
end

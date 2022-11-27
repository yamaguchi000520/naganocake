class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def index
    @orders = Order.all
  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @order.update(order_params)

    if @order.status == "confirmation"
      @order_items.update_all(production_status: "witing_for_production")
    end
    flash[:notice] = "注文ステータスの更新が完了しました"
    redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end

class Admin::OrderItemsController < ApplicationController


  def update
    @order_item=OrderItem.find(params[:id])
    @order = @order_item.order
    @order_item.update(order_item_params)
    if @order_item.production_status == "in_production"
      @order.update(status: "make")
    elsif @order.order_items.count == @order.order_items.where(production_status: "completion_of_production").count
      @order.update(status: "ready")
      # まずは.countを用いて、数を数えてあげる
      # その後、whereを使って条件指定をしてあげる
    end
    flash[:notice]="変更を修正しました"
    redirect_to admin_order_path(@order)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:product_id,:order_id,:product_count,:price,:production_status)
  end

end

class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.find(params[:order_id])
    @order.save!
    # redirect_to user_path(@home)

    # render "order/show"
  end

  private

  def order_params
    params.require(:order).permit(:total_price)
  end
end
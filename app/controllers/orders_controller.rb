class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_box, only: [:new, :create]


  def new
    @box = Box.find(params[:box_id])
    @order = Order.new
  end

  def create
    @box = Box.find(params[:box_id])
    @order = Order.new(order_params)
    @order.box = @box
    @order.user = @user
    @order.total_price = @box.price
    @order.save!

    redirect_to user_path(@home)

    # render "order/show"
  end

  private
    
    def set_order
      @order = Order.find(params[:id])
    end
    def set_box
      @box = Box.find(params[:box_id])
    end


    def order_params
      params.require(:order).permit(:total_price)
    end
end
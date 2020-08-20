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
    @order.user = current_user
    @order.total_price = @box.price
    @order.save!

    if @order.save
      redirect_to box_path(@box), notice: 'You have successfully ordered the box'
    else
      render :new
    end

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
      params.permit(:user_id, :box_id)
    end
end
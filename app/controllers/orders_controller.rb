class OrdersController < ApplicationController
  #before_action :set_box, only: [:new, :create]
  #before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    
    @user = current_user
    
    @boxes = Box.where(user_id: current_user.id)

    @orders = Order.where(user_id: current_user.id)
  end

  def new
    @box = Box.find(params[:box_id])
    @order = Order.new
    #authorize @order
  end


  def create
    @box = Box.find(params[:box_id])
    @order = Order.new(order_params)
    @order.user = current_user
    @order.box = @box
     @order.save!
    #authorize @order

    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end


  def show
    @order = Order.find(params[:id])
    #authorize @order
  end

  def edit
  end

  def order_params
    params.permit(:user_id, :box_id)
  end
end

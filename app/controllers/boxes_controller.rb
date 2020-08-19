class BoxesController < ApplicationController
  before_action :set_box, only: [:show]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @boxes = Box.all
  end

  def show
    @order = Order.new
  end

  def new
    @box = Box.new
    @user = current_user
  end

  def create
    @user = current_user
    @box = Box.new(box_params)
    @box[:user_id] = @user.id
    if @box.save
      redirect_to :boxes, notice: 'Box was successfully created.'
    else
      render :new
    end
  end

  def destroy
  end

  def home
  end

  private

  def set_box
    @box = Box.find(params[:id])
  end

  def box_params
    params.require(:box).permit(:name, :weight, :size, :price, :content)
  end

end

class BoxesController < ApplicationController
  before_action :set_box, only: [:show]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:query].present?                                    #Search for query and display
      @search_query = params[:query]
      @boxes = Box.where("name iLike '%#{params[:query]}%'") #Finetune seach for name here
      .or(Box.where(weight: params[:query]))
      .or(Box.where(size: params[:query]))
      .or(Box.where(price: params[:query]))
      .or(Box.where("content iLike '%#{params[:query]}%'"))       #Finetune search for content here
    else                                                          #If not present than list all available boxes
      @boxes = Box.all
    end
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

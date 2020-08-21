class BoxesController < ApplicationController
  before_action :set_box, only: [:show]
  skip_before_action :authenticate_user!, only: [ :index, :show]

  def index
  
    if params[:query].present?                                    #Search for query and display
      @search_query = params[:query]
      @boxes = Box.where("name iLike '%#{params[:query]}%'") #Finetune seach for name here
      .or(Box.where(weight: params[:query]))
      .or(Box.where(size: params[:query]))
      .or(Box.where(price: params[:query]))
      .or(Box.where("content iLike '%#{params[:query]}%'"))       #Finetune search for content here
    else
      @boxes = Box.all
      @user = current_user.email                                                 #If not present than list all available boxes
      @user = User.find_by(email: @user)
      @user_boxes = Box.where(user_id: @user.id)
    end
 
  end

  def show
    @order = Order.new
   
    @marker = 
      {
        lat: @order.box.latitude,
        lng: @order.box.longitude
      }
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
      redirect_to box_path(@box), notice: 'Box was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @box = Box.find(params[:id])
    @box.destroy
    redirect_to boxes_path
  end

  def home
  end

  private

  def set_box
    @box = Box.find(params[:id])
  end

  def box_params
    params.require(:box).permit(:name, :weight, :size, :price, :content, :address, photos: [])
  end

end
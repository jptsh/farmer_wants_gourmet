class BoxesController < ApplicationController
  before_action :set_box, only: [ :show ]
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  
  def index
    @boxes = Box.all
  end

  def show
  end

  def new
    @box = Box.new
  end

  def create
    @box = Box.new(box_params)
    if @box.save
      redirect_to @box, notice: 'Box was successfully created.'
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
    params.require(:box).permit(:name)
  end


end

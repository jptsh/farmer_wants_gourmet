class BoxesController < ApplicationController
  before_action :set_box, only [:show, :destroy, :update ]
  
  def index
    @boxes = Box.all
  end

  def show
    @box = Box.find(params[:id])
  end

  def new
    @box = Box.new
  end

  def create
    @box = Box.new(box_params)
    if @box.save
      redirect_to @cocktail, notice: 'Box was successfully created.'
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

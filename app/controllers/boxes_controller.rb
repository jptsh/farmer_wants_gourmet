class BoxesController < ApplicationController
  before_action :set_box

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

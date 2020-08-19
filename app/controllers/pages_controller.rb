class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  
  def home
    @boxes = Box.all
    if params[:query].present?                                    #Search for query and display
      @search_query = params[:query]
      @boxes_result = Box.where("name iLike '%#{params[:query]}%'") #Finetune seach for name here
      .or(Box.where(weight: params[:query]))
      .or(Box.where(size: params[:query]))
      .or(Box.where(price: params[:query]))
      .or(Box.where("content iLike '%#{params[:query]}%'"))       #Finetune search for content here
    else                                                          #If not present than list all available boxes
      @boxes = Box.all
    end
  end
end

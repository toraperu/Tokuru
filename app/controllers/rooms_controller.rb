class RoomsController < ApplicationController
  def index
  end

  def show
  	@room = Room.find(params[:id])
    @product = @room.product
  	@user = @product.user
  end

  def create
  end



end

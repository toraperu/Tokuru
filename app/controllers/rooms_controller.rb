class RoomsController < ApplicationController
  def index
  end

  def show
  	@room = Room.find(params[:id])
    @product = @room.product
  	@user = @product.user
  end

  def create
  	@room = Room.new(room_params)
  	@room.save
  	redirect_to room_path(params[:id])
  end

  private

  def room_params
  	params.require(:room).permit(:user_id, :product_id)
  end



end

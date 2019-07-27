class RoomsController < ApplicationController
  def index
  end

  def show
  	@room = Room.find(params[:id])
    @product = @room.product
  	@user = @product.user
  end

  def create
  	@room = Room.new
  	@room.user_id = params[:buyer_id]
  	@room.product_id = params[:product_id]
  	if @room.save
  		redirect_to room_path(@room.id)
 	else
  		render :index
  	end
  end

  private

  def room_params
  	params.require(:room).permit(:user_id, :product_id)
  end



end

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
    @room.product_id = params[:product_id]
  	@room.buyer_id = params[:buyer_id]
  	@room.seller_id = params[:seller_id]
  	if @room.save
  		redirect_to room_path(@room.id)
 	else
  		render :index
  	end
  end

  def permit
    @room = Room.find(params[:id])
    @room.update({permitted?: true})
  end

  def permitted
    @room = Room.find(params[:id])
    @room.update({permitted?: false})
  end



end

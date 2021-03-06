class RoomsController < ApplicationController
  #ユーザー名がないとルームを作成できない
  before_action :setup_username, only:[:create]
  # #他人のルームにurlからいけない
  # before_action :correct_user, only: [:show]

  def index
    @buyer_rooms = current_user.buyer_rooms.order(id: "DESC").page(params[:buyer_room_page]).per(6)
    @seller_rooms = current_user.seller_rooms.order(id: "DESC").page(params[:seller_room_page]).per(6)
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
      @room.create_notification_room!(@room.buyer_id, @room.id)
  		redirect_to room_path(@room.id)
   	else
  		render :index
  	end
  end

  def destroy
    @room = Room.find(params[:id])
    @room_id = @room.id
    if @room.destroy
      flash[:danger] = "ルームを削除しました"
      redirect_to rooms_path
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




  private

  def setup_username
    unless current_user.name.present?
      @product = Product.find(params[:product_id])
      flash[:danger] = 'ユーザー名を入力してください'
      redirect_to user_product_path(@product.user, @product)
    end
  end

  # def correct_user
  #   @room = Room.find(params[:id])
  #   @user = @room.buyer || @user = @room.seller
  #   unless @user == current_user
  #     flash[:danger] = '自分のルームを選択してください'
  #     redirect_to user_path(current_user)
  #   end
  # end



end

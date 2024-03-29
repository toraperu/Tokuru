class OrdersController < ApplicationController

  def new
  	@product = Product.find(params[:product_id])
  	@order = Order.new
  end

  def create
  	@product = Product.find(params[:product_id])
  	@order = current_user.orders.build(order_params)
  	@order.product_id = @product.id
  	@order.other_contact = params[:order][:other_contact] if @order.contact == 4
  	@order.my_skill = params[:order][:my_skill] if @order.payment == 1
  	if @order.save
      @order.product.increment(:sale_result, 1)
      @order.create_order_notification!(current_user, @order.id)
  		redirect_to order_confirm_path(@order.id)
  	else
      flash.now[:danger] = '連絡手段、連絡番号、および支払い手段の入力が完了していません'
  		render :new
  	end
  end

  def confirm
  	@order = Order.find(params[:id])
  	@product = @order.product
  end

  def index
  end





  private

  def order_params
  	params.require(:order).permit(:product_id, :payment, :contact_info,
  								  :price, :contact, :other_contact, :my_skill)
  end
end

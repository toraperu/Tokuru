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
  		redirect_to order_confirm_path(@order.id)
  	else
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

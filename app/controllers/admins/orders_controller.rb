class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
  	@order = Order.find(params[:id])
  end

  def destroy
  	@order = Order.find(params[:id])
  	@order_id = @order.id
  	@order.destroy
  end
end

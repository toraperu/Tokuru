class Admins::OrdersController < ApplicationController
  def index
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

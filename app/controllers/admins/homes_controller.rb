class Admins::HomesController < ApplicationController
  def top
  	@users = User.page(params[:page]).per(10)
  	@products = Product.page(params[:page]).per(10)
  	@orders = Order.page(params[:page]).per(10)
  end
end

class Admins::HomesController < ApplicationController
  def top
  	@users = User.all
  	@products = Product.all
  	@orders = Order.all
  end
end

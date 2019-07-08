class FavoritesController < ApplicationController
	before_action :authenticate_user!

	def fav
	    @product = Product.find(params[:id])
    	if @product.favorited_by?(current_user)
		    fav = current_user.favorites.find_by(product_id: @product.id)
		    fav.destroy
		    # render json: product.id
	    else
		    fav = current_user.favorites.new(product_id: @product.id)
		    fav.save
		    # render json: product.id
	    end
	end
	
end

class GenresController < ApplicationController
  def show
  	@genre = Genre.find(params[:id])
  	@products = @genre.products.at_sale.page(params[:page]).per(6).order(created_at: :desc)
  end


  private

  def genre_params
  	params.require(:genre).permit(:name)
  end

  def product_params
  	params.require(:product).permit(:name, :price, :jacket_image, :finish)
  end
end

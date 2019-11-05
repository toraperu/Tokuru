class Admins::ProductsController < ApplicationController
    def index
      @products = Product.page(params[:page]).per(10)
    end

    def show
    	@product = Product.find(params[:id])
    end

    def edit
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to admins_product_path(@product)
      else
        render :edit
      end
    end

    def destroy
    	@product = Product.find(params[:id])
    	@product_id = @product.id
    	@product.destroy
    end

    private

    def product_params
      params.require(:product).permit(:jacket_image, :name, :price,
                                      :body, :caution, :sale_result, :finish)
    end
end

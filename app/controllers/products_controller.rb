class ProductsController < ApplicationController
  #ユーザー名が無いと商品投稿ができない仕組み
  before_action :setup_username, only:[:create]

  def index
    @genres = Genre.all
    @products = Product.at_sale.order(id: "DESC").page(params[:page]).per(6)
  end

  def test
    @products = Product.all.page(params[:page]).per(3)
  end

  def search_list
    @products = Product.at_sale.search(params[:search]).page(params[:page]).per(4)
  end

  def new
    @product = Product.new
    @genres = Genre.all
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to user_product_path(current_user, @product)
    else
      flash.now[:danger] = '商品名、価格および商品情報が不足しています'
      render :new
    end
  end

  def about
  end

  def show
    @product = Product.find(params[:id])
    @comments = Comment.all
    @orders = Order.all
  end

  def edit
    @genres = Genre.all
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "編集内容を更新しました"
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def product_params
    params.require(:product).permit(:name, :body, :avatar,
                                    :price, :genre_id, :finish,
                                    :sale_result, :caution)
  end

  def setup_username
    unless current_user.name.present?
      render :new
    else
      @genres = Genre.all
      @product = Product.new(product_params)
    end
  end
end

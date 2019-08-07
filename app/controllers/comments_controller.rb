class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def create
  	@product = Product.find(params[:product_id])
  	@comment = @product.comments.build(comment_params)

  	if @comment.user_id = current_user.id
      @comment.save
      redirect_to user_product_path(@product.user_id, @product.id)
    else
      render :new
    end
  end

  def edit
  	@comment = Comment.find(params[:id])
  	@product = @comment.product
  end

  def update
  	@comment = Comment.find(params[:id])

    @product = @comment.product
  	if @comment.update(comment_params)
      redirect_to user_product_path(@product.user_id, @product.id)
    else
      render :edit
    end

  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment_id = @comment.id
  	@comment.destroy
  end


  private

  def comment_params
  	params.require(:comment).permit(:user_id, :product_id, :star, :body)
  end


end

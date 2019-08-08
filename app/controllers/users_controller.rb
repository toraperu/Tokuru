class UsersController < ApplicationController
	#他ユーザーの情報にアクセスできないようにする
	before_action :correct_user, only: [:show, :edit, :update, :resign]

	def show
		@user = User.find(params[:id])
		#カルーセルでactiveにする一件
		@first_favorite = @user.favorites.first
		#カルーセルで表示する全件
		@favorites = @user.favorites.all
		@count = 1
		@products = @user.products.page(params[:page]).per(8)
		#renderで渡すインスタンス変数
		@orders = @user.orders.page(params[:page]).per(6)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			sign_in(@user, bypass: true)  #パスワードが変更された時、強制ログアウト=>ログインする
			redirect_to user_path(@user.id)
		else
			render :edit
		end
	end

	def resign
		@user = User.find(params[:id])
	end

	def resign_confirm
		@user = User.find(params[:id])
		if @user.update(resignation: true)
			flash[:danger] = "退会しました"
			redirect_to root_path
		else
			render :resign
		end
	end


	private



	def correct_user
		@user = User.find(params[:id])
		@genres = Genre.all
    	@products = Product.at_sale.order(id: "DESC").page(params[:page]).per(6)
		unless @user == current_user
			flash.now[:danger] = 'あなたにはアクセスする権限がありません'
			render 'products/index'
		end
	end

	def user_params
		params.require(:user).permit(
			:name, :real_name, :avatar, :profile, :email, :password, :password_confirmation)
	end


end


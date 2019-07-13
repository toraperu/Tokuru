class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		#カルーセルでactiveにする一件
		@first_favorite = @user.favorites.first
		#カルーセルで表示する全件
		@favorites = @user.favorites.all
		@count = 1
		@products = @user.products.all
		#renderで渡すインスタンス変数
		@orders = Order.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			sign_in(@user, bypass: true)  #パスワードが変更された時、強制ログアウト=>ログインする
			flash[:notice] = "編集内容を更新しました"
			redirect_to user_path(@user.id)
		else
			render :"/users/edit"
		end
	end

	def resign
		@user = User.find(params[:id])
	end

	def resign_confirm
		@user = User.find(params[:id])
		@user.update(resignation: true)
		flash[:danger] = "退会しました"
		redirect_to root_path
	end


	private

	def user_params
		params.require(:user).permit(
			:name, :real_name, :profile_image, :profile, :email, :password, :password_confirmation)
	end


end


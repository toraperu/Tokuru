class Admins::UsersController < ApplicationController
	def index
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to admins_user_path(@user)
		else
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user_id = @user.id
		@user.destroy
	end

	private

	def user_params
		params.require(:user).permit(:profile_image, :name, :profile)
	end
end

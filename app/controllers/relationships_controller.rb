class RelationshipsController < ApplicationController
	#フォロワーとフォローする人がrelationshipsレコードに入っているか
	before_action :set_user


	def create
		user = User.find(params[:relationship][:follow_id])
		following = current_user.follow(user)
		if following.save
			flash[:success] = "ユーザーをフォローしました"
			redirect_to user
		else
			flash[:danger] = "ユーザーのフォローに失敗しました"
			redirect_to user
		end
	end

	def destroy
		user = User.find(params[:relationship][:follow_id])
		following = current_user.unfollow(user)
		if following.destroy
			flash[:success] = "ユーザーのフォローを解除しました"
			redirect_to user
		else
			flash[:danger] = "フォロー解除に失敗しました"
			redirect_to user
		end
	end

	private

	def set_user
		user = User.find(params[:relationship][:follow_id])
	end


end

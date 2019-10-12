class LikesController < ApplicationController

	def create
		current_user.likes.create(post_id: params[:post_id])
		redirect_back fallback_location: root_path
	end

	def destroy
		like = Like.find(params[:id])
		like.destroy
		redirect_back fallback_location: root_path
	end
end

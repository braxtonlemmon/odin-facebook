class UsersController < ApplicationController

	def show
		@post = Post.new
		@user = User.find(params[:id])
		@posts = @user.feed
	end

	def friends
		@user = User.find(params[:id])
	end

	def index
		@users = User.all 
	end
end

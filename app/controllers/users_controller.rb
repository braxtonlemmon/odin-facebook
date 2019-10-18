class UsersController < ApplicationController
	def show
		@post = Post.new
		@user = User.find(params[:id])
		@posts = @user.feed.paginate(page: params[:page])
	end

	def index
		@users = User.where.not(id: current_user.id).paginate(page: params[:page])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = 'Profile updated'
			bypass_sign_in(@user)
			redirect_to @user
		else
			render 'edit'
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :name, :avatar, :password, :password_confirmation)
	end
end

class FriendshipsController < ApplicationController
	before_action :authenticate_user!

	def create
		Friendship.create_reciprocal_for_ids(current_user.id, params[:friend_id])
		flash[:success] = 'You are now friends!'
		request = FriendRequest.find_by(invitee_id: current_user.id, inviter_id: params[:friend_id])
		request.destroy
		redirect_to current_user
	end

  def destroy
	end
	
	private

	def find_request(user)
		FriendRequest.where('inviter_id = ? and invitee_id = ?',
												user.id, current_user.id).first
	end

	def friendship_params
		params.require(:friendship).permit(:friend_id, :user_id)
	end
end
class Api::FriendshipsController < ApplicationController
  
  before_action :authenticate!

  def create
    friendship = current_user.friendships.create! friend: friend
    render action: :create, locals: { friendship: friendship }, status: :created
  end

  def destroy
    friendship = current_user.friendships.find_by! friend_id: friend.id
    friendship.destroy
    head :no_content
  end

  def friendship_params
    params.require(:friendship).permit(:email)
  end

  def friend
    User.find_by(email: (params[:email] || friendship_params[:email]) )
  end
end

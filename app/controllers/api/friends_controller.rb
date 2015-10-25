class Api::FriendsController < ApplicationController

  before_action :authenticate!

  def index
    friends = current_user.friends
    render action: :index, locals: { friends: friends }, status: 200
  end
end

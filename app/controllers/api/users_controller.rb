class Api::UsersController < ApplicationController

  def create
    user = User.create! user_params
    render action: :create, locals: { user: user }, status: :created
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

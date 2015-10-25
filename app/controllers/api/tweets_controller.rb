class Api::TweetsController < ApplicationController

  before_action :authenticate!

  def create
    tweet = current_user.tweets.create! tweet_params
    render action: :create, locals: { tweet: tweet }, status: :created
  end

  def feeds
    tweets = current_user.feeds params: {}
    render action: :feeds, locals: { tweets: tweets }, status: :ok
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

end

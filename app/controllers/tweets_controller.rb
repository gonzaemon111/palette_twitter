class TweetsController < ApplicationController
  def index
    tweets = Tweet.all.order(:updated_at)
    @tweets = TweetDecorator.decorate_collection(tweets)
  end

  def new
    tweet = Tweet.new
    @tweet = TweetDecorator.decorate(tweet)
  end

  def create
    Rails.logger.debug "params: #{params}"
    redirect_to "/"
  end
end
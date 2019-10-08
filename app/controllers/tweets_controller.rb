class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show]
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
    Rails.logger.debug "current_user: #{current_user}"
    tweet = Tweet.new(tweet_params)
    if tweet.save
      Rails.logger.debug "1"
      redirect_to tweets_path
    else
      Rails.logger.debug "2"
      redirect_to tweets_path
    end
  end

  def show
    
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
  
  def tweet_params
    params
      .require(:tweet)
      .permit(
        :content,
        :image
      )
      .merge(
        user_id: current_user.id
      )
  end
end
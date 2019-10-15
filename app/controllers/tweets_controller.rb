class TweetsController < ApplicationController
  before_action :current_user

  def index
    tweets = Tweet.includes(:user).order(updated_at: :desc)
    @tweets = TweetDecorator.decorate_collection(tweets)
    followings_ids = []
    @current_user.followings.each do |user|
      followings_ids.push user.id
    end
    retweets = Tweet.includes(:user).where(user_id: followings_ids).order(updated_at: :desc)
    @retweets = TweetDecorator.decorate_collection(retweets)
  end

  def new
    tweet = Tweet.new
    @tweet = TweetDecorator.decorate(tweet)
  end

  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
      flash[:success] = I18n.t("requests.flash.tweets.create.success")
      redirect_to tweets_path
    else
      flash.now[:danger] = I18n.t("requests.flash.tweets.create.failure")
      render :new
    end
  end

  def show
    @tweet = TweetDecorator.decorate(tweet)
    @reply_tweets = TweetDecorator.decorate_collection(Tweet.where(tweet_id: @tweet.id).order(created_at: "DESC"))
    @reply_tweet = Tweet.new
  end

  def edit; end

  def update
    if tweet.update(tweet_params)
      flash[:success] = I18n.t("requests.flash.tweets.update.success")
      redirect_to tweet_path(tweet)
    else
      flash.now[:danger] = I18n.t("requests.flash.tweets.update.failure")
      render :edit
    end
  end

  def destroy
    if tweet.destroy
      flash[:success] = I18n.t("requests.flash.tweets.destroy.success")
      redirect_to tweets_path
    else
      flash[:danger] = I18n.t("requests.flash.tweets.destroy.failure")
      redirect_to tweet_path(tweet)
    end
  end

  def create_reply_tweet
    @tweet = TweetDecorator.decorate(Tweet.find(reply_tweet_params[:tweet_id]))
    @reply_tweets = TweetDecorator.decorate_collection(Tweet.where(tweet_id: @tweet.id).order(created_at: "DESC"))
    @reply_tweet = Tweet.new(reply_tweet_params)
    respond_to do |format|
      if @reply_tweet.save
        flash.now[:success] = I18n.t("requests.flash.tweets.create_retweet.success")
        format.html
        format.js
      else
        flash.now[:danger] = I18n.t("requests.flash.tweets.create_retweet.failure")
        redirect_to tweets_path
      end
    end
  end

  private

  def tweet
    @tweet = Tweet.find(params[:id])
  end
  helper_method :tweet
  
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

  def reply_tweet_params
    params
      .require(:tweet)
      .permit(
        :content,
        :image,
        :tweet_id
      )
      .merge(
        user_id: current_user.id
      )
  end
end

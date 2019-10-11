class TweetsController < ApplicationController
  before_action :current_user
  before_action :set_tweet, only: %i[show destroy edit update]
  def index
    tweets = Tweet.order(updated_at: :desc)
    @tweets = TweetDecorator.decorate_collection(tweets)
    retweets = []
    @current_user.followings.each do |user|
      user.tweets.order(updated_at: :desc).each do |tweet|
        retweets.push tweet
      end
    end
    @retweets = TweetDecorator.decorate_collection(retweets)
  end

  def new
    tweet = Tweet.new
    @tweet = TweetDecorator.decorate(tweet)
  end

  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
      flash[:success] = "ツイートの作成が成功しました"
      redirect_to tweets_path
    else
      flash[:success] = "ツイートの作成が成功しました"
      redirect_to tweets_path
    end
  end

  def show
    @tweet = TweetDecorator.decorate(@tweet)
    @reply_tweets = TweetDecorator.decorate_collection(Tweet.where(tid: @tweet.id).order(created_at: "DESC"))
    @reply_tweet = Tweet.new
  end

  def edit; end

  def update
    if @tweet.update(tweet_params)
      flash.now[:success] = "ツイートの更新が成功しました"
      redirect_to tweet_path(@tweet)
    else
      flash.now[:danger] = "ツイートの更新が失敗しました"
    end
  end

  def destroy
    if @tweet.destroy
      flash.now[:success] = "ツイートの削除が成功しました"
    else
      flash.now[:danger] = "ツイートの削除が失敗しました"
    end
    redirect_to tweets_path
  end

  def create_retweet
    @tweet = TweetDecorator.decorate(Tweet.find(retweet_params[:tid]))
    @reply_tweets = TweetDecorator.decorate_collection(Tweet.where(tid: @tweet.id).order(created_at: "DESC"))
    @reply_tweet = Tweet.new(retweet_params)
    respond_to do |format|
      if @reply_tweet.save
        format.html
        format.js
      else
        redirect_to tweets_path
      end
    end
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

  def retweet_params
    params
      .require(:tweet)
      .permit(
        :content,
        :image,
        :tid
      )
      .merge(
        user_id: current_user.id
      )
  end
end
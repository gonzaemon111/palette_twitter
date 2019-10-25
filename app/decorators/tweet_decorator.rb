class TweetDecorator < ApplicationDecorator
  delegate_all

  def user_nickname
    object.user.nickname
  end
end
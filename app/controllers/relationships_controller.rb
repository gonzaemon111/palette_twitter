class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    @user = User.find(params[:follow_id])
    Rails.logger.debug "@current_user : #{@current_user}"
    Rails.logger.debug "@current_user.class : #{@current_user.class}"
    Rails.logger.debug "current_user : #{current_user}"
    Rails.logger.debug "current_user.class : #{current_user.class}"
    following = @current_user.follow(@user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to @user
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to @user
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to user
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to user
    end
  end

  private

  def set_user
    user = User.find(params[:follow_id])
  end
end

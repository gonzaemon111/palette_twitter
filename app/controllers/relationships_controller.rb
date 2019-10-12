class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    @user = User.find(params[:follow_id])
    following = current_user.follow(@user)
    if following.save
      flash[:success] = I18n.t("requests.flash.relationships.create.success")
      redirect_to @user
    else
      flash.now[:alert] = I18n.t("requests.flash.relationships.create.failure")
      redirect_to @user
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:success] = I18n.t("requests.flash.relationships.destroy.success")
      redirect_to user
    else
      flash.now[:alert] = I18n.t("requests.flash.relationships.destroy.failure")
      redirect_to user
    end
  end

  private

  def set_user
    user = User.find(params[:follow_id])
  end
end

class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:follow_id])
    following = current_user.follow(user)
    if following.save
      flash[:success] = I18n.t("requests.flash.relationships.create.success")
      @user =  UserDecorator.decorate(user)
      redirect_to user_path(@user)
    else
      flash[:alert] = I18n.t("requests.flash.relationships.create.failure")
      redirect_to user
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:success] = I18n.t("requests.flash.relationships.destroy.success")
      @user =  UserDecorator.decorate(user)
      redirect_to user_path(@user)
    else
      flash[:alert] = I18n.t("requests.flash.relationships.destroy.failure")
      redirect_to user
    end
  end
end

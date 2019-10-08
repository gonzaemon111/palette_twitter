class UsersController < ApplicationController
  before_action :set_user, only: %i[show update]

  def new
    Rails.logger.debug "cookies : #{cookies.inspect}"
    Rails.logger.debug "cookies : #{cookies[:token]}"
    @user = User.new
  end

  def signin
  end

  def signup
    user = ::Users::NewUsecase.new(users_params).execute
    if user
      sign_in(user[:token])
      Rails.logger.debug ""
      redirect_to tweets_path
    else
      # flash.now[:danger] = t('.flash.invalid_password')
      flash.now[:danger] = "hogehoge"
      redirect_to users_sign_up_path
    end
  end

  def show
    
  end

  def update
    
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def users_params
    params
      .require(:user)
      .permit(
        :email,
        :password,
        :password_confirmation,
        :nickname,
        :content,
        :title
      )
  end
end

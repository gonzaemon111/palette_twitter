class UsersController < ApplicationController

  def signin_input
    @user = User.new
  end

  def signin
    user = User.find_by(email: user_params[:email])
    redirect_to signin_users_path, danger: I18n.t("flash.users.sign_in.not_found_user") and return unless user
    @user = user.authenticate(user_params[:password])
    if @user
      sign_in(@user.token)
      flash[:success] = I18n.t("requests.flash.users.sign_in.success")
      redirect_to tweets_path
    else
      flash[:danger] = I18n.t("requests.flash.users.sign_in.failure")
      redirect_to signin_users_path
    end
  end

  def new
    @user = User.new
  end

  def signup
    user = ::Users::SignupUsecase.new(user_params).execute
    if user
      sign_in(user[:token])
      flash[:success] = I18n.t("requests.flash.users.sign_up.success")
      redirect_to tweets_path
    else
      flash[:danger] = I18n.t("requests.flash.users.sign_up.failure")
      redirect_to signup_users_path
    end
  end

  def show
    current_user
    @user = UserDecorator.decorate(user)
  end

  def update
    
  end

  def signout
    sign_out
    flash[:success] = I18n.t("requests.flash.users.logout.success")
    redirect_to signin_users_path
  end

  private

  def user
    User.find(params[:id])
  end

  def user_params
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

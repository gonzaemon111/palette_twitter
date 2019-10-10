class UsersController < ApplicationController
  # before_action :user, only: %i[show update]

  def signin_input
    # redirect_to root_path and return if current_user
    @user = User.new
  end

  def signin
    user = User.find_by(email: user_params[:email])
    redirect_to users_signin_path, danger: "入力されたEmailは登録されいていません" and return unless user
    @user = user.authenticate(user_params[:password])
    if @user
      sign_in(@user.token)
      flash.now[:success] = "ログインに成功しました"
      redirect_to tweets_path
    else
      flash.now[:danger] = "SignInができませんでした。確認してみて下さい"
      redirect_to users_signin_path
    end
  end

  def new
    redirect_to root_path and return if current_user
    @user = User.new
  end

  def signup
    user = ::Users::NewUsecase.new(user_params).execute
    if user
      sign_in(user[:token])
      redirect_to tweets_path
    else
      # flash.now[:danger] = t('.flash.invalid_password')
      flash.now[:danger] = "hogehoge"
      redirect_to users_signup_path
    end
  end

  def show
    @user = UserDecorator.decorate(user)
  end

  def update
    
  end

  def signout
    Rails.logger.debug "params : #{params}"
    sign_out
    Rails.logger.debug "cookies[:token].nil? : #{cookies[:token].nil?}"
    redirect_to users_signin_path
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

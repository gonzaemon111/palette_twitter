class UsersController < ApplicationController
  # before_action :user, only: %i[show update]

  def signin_input
    # redirect_to root_path and return if current_user
    @user = User.new
  end

  def signin
    user = User.find_by(email: user_params[:email])
    redirect_to signin_users_path, danger: "入力されたEmailは登録されいていません" and return unless user
    @user = user.authenticate(user_params[:password])
    if @user
      sign_in(@user.token)
      flash[:success] = "ログインに成功しました"
      redirect_to tweets_path
    else
      flash[:danger] = "SignInができませんでした。確認してみて下さい"
      redirect_to signin_users_path
    end
  end

  def new
    # redirect_to root_path and return if current_user
    @user = User.new
  end

  def signup
    user = ::Users::NewUsecase.new(user_params).execute
    if user
      sign_in(user[:token])
      flash[:success] = "ユーザ登録に成功しました"
      redirect_to tweets_path
    else
      flash[:danger] = "フォームを全て入力してください！"
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
    Rails.logger.debug "params : #{params}"
    sign_out
    flash[:success] = "ログアウトしました"
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

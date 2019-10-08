class UsersController < ApplicationController
  before_action :set_user, only: %i[show update]

  def signin_input
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

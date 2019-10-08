class ApplicationController < ActionController::Base
  before_action :current_user
  def sign_in(token)
    cookies.permanent[:token] = token
    current_user
  end

  def sign_out
    cookies.delete(:token)
  end

  def current_user
    @current_user = User.find_by(token: cookies[:token])
    if @current_user
      @current_user
    else
      redirect_to users_signin_path and return
    end
  end
end

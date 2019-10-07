class ApplicationController < ActionController::Base
  before_action :current_user
  def sign_in(token)
    cookies.permanent[:token] = token
    current_user
  end

  def current_user
    @current_user = User.find_by(token: cookies[:token])
  end
end

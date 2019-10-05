class ApplicationController < ActionController::Base
  def sign_in(token)
    cookies.permanent[:token] = token
    current_user
  end

  def current_user
    User.find_by(token: cookies[:token])
  end
end

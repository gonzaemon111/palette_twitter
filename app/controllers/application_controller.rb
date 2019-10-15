class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :ensure_signed_in
  def sign_in(token)
    cookies.permanent[:token] = token
    current_user
  end

  def sign_out
    cookies.delete(:token)
  end

  def current_user
    @current_user ||= User.find_by(token: cookies[:token])
  end

  # 全リンクにlocale情報をセットする
  def default_url_options(options={})
    { :locale => I18n.locale }
  end

  def ensure_signed_in
    unless current_user
      flash[:danger] = I18n.t("requests.flash.users.sign_in.failure")
      redirect_to signin_users_path 
    end
  end

  # リンクの多言語化に対応する
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private
  def not_found_current_user
    redirect_to signin_users_path and return
  end
end

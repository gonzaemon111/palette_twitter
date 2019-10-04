class UsersController < ApplicationController

  def new
    Rails.logger.debug "hogehoge"
  end

  def sign_in
    user = User.new(users_params)
    if user.save
    else
      redirect_to 
    end
  end

  def sign_up
    
  end

  def show
    
  end

  def update
    
  end

  private

  def users_params
    params
      .require(:users)
      .permit(
        :email,
        :password,
        :nickname
      )
  end
end

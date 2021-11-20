class AuthController < ApplicationController
  include AuthHelper

  before_action :redirect_to_mypage, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:auth][:email].downcase)
    if user && user.authenticate(params[:auth][:password])
      log_in user
      redirect_to user_path(user.username), success: 'Welcome back!!'
    else
      flash[:danger] = 'Invalid email/password combination.'
      redirect_to log_in_path
    end
  end

  def destroy
    log_out if is_logged_in?
    flash[:success] = 'ログアウトしました。'
  end

  private
    def redirect_to_mypage
      redirect_to user_path(current_user.username) if is_logged_in?
    end
end

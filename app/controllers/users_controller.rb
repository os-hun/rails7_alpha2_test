class UsersController < ApplicationController
  include AuthHelper

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_sign_up, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(set_params)
    @user.username = SecureRandom.hex(10)

    if @user.save
      redirect_to user_path(@user.username), success: 'Welcome to Rails7Alpha2Test App!'
    else
      flash[:danger] = @user.errors.full_messages
      redirect_to sign_up_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def set_user
      @user = User.find_by(username: params[:username])
    end

    def set_params
      params.require(:user).permit(:name, :email, :password, :username)
    end

    def redirect_to_sign_up
      redirect_to log_in_path unless is_current_user?(@user)
    end
end

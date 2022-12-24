class UsersController < ApplicationController
	skip_before_action :require_login
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: '成功しました'
    else
			flash.now[:danger] = '失敗しました'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end

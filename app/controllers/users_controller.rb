class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create_with_credentials(user_params)
    redirect_to root_path
  rescue ActiveRecord::RecordInvalid => err
    render :new
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

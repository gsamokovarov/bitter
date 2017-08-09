class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create_with_credentials(user_params)
    UserMailer.welcome_mail(@user).deliver_later

    redirect_to root_path
  rescue ActiveRecord::RecordInvalid => err
    @user = User.new
    render :new, status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

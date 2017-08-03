class AuthenticationsController < ApplicationController
  def new
    if current_user
      redirect_to posts_path
    else
      @user = User.new
    end
  end

  def create
    if user.authenticate(user_params[:password])
      self.current_user = user
      redirect_to root_path
    else
      redirect_to new_authentication_path
    end
  end

  private

  def user
    User.find_by!(email: user_params[:email])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

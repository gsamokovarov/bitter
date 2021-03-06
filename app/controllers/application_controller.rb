class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  respond_to :html

  def authenticate
    if current_user.nil?
      redirect_to new_authentication_path,
        notice: "User authentication required"
    end
  end

  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end

  def current_user=(user)
    cookies.signed[:user_id] = user.id
  end
end

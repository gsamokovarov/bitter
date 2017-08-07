class Api::ApplicationController < ActionController::API
  use JWTMiddleware

  respond_to :json

  def authenticate
    if current_user.nil?
      render json: {code: :unauthorized}
    end
  end

  def current_user
    @current_user ||= User.find_by(id: claims["sub"])
  end

  private

  def claims
    request.env['jwt.token'] || {}
  end
end

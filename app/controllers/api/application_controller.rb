class Api::ApplicationController < ActionController::API
  include ErrorHandling

  respond_to :json

  use JWTMiddleware

  def current_user
    @current_user ||= User.find_by(id: claims["sub"])
  end

  private

  def authenticate
    if current_user.nil?
      render json: {code: :unauthorized}
    end
  end

  def claims
    request.env['jwt.token'] || {}
  end
end

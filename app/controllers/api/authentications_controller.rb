class Api::AuthenticationsController < Api::ApplicationController
  def create
    if user.authenticate(params[:password])
      respond_with user, serializer: TokenSerializer, location: nil
    else
      render_error 401, code: :unauthorized
    end
  rescue ActiveRecord::RecordNotFound
    render_error 401, code: :unauthorized
  end

  private

  def user
    User.find_by! email: params[:email]
  end
end

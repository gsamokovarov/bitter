module Api
  # Keep in mind that this 👇 has different access to Api:: constants than
  # Api::UsersController < Api::ApplicationController.
  class UsersController < ApplicationController
    def create
      user = User.create_with_credentials(user_params)
      respond_with user, serializer: UserWithTokenSerializer, location: nil
    end

    def user_params
      params.permit(:email, :password)
    end
  end
end

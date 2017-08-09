require 'rails_helper'

RSpec.describe Api::AuthenticationsController, type: :request do
  describe "POST /api/authentication" do
    it "authorizes a user with correct email and password" do
      user = create :user

      post api_authentication_path, params: {
        email: user.email,
        password: user.password
      }

      expect(response).to be_successful
      expect(response).to eq_as_json \
        jwt: Token.encode(sub: user.id)
    end

    it "errors with the HTTP 401 Unauthorized status code on bad input" do
      # Attention! This will only build the user object in memory, and won't
      # save it in the database. That's why the authentication will fail.
      user = build :user

      post api_authentication_path, params: {
        email: user.email,
        password: user.password
      }

      expect(response).to have_http_status(:unauthorized)
      expect(response).to eq_as_json \
        code: "unauthorized"
    end
  end
end

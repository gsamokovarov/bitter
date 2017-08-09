require 'rails_helper'

module Api
  RSpec.describe UsersController, type: :request do
    describe "POST /api/users" do
      it "authorizes a user with correct email and password" do
        expect {
          post api_users_path, params: {
            email: 'gsamokovarov@gmail.com', password: 'test1234' }
        }.to change {
          [User.count, Credentials.count]
        }.from([0, 0]).to([1, 1])

        expect(response).to be_successful

        user = User.last
        expect(response.body).to eq_as_json \
          id: user.id,
          email: user.email,
          jwt: Token.encode(sub: user.id)
      end

      it "errors on invalid data" do
        post api_users_path, params: {
          email: 'gsamokovarov@gmail.com',
        }

        expect(response).to have_http_status(422)
        expect(response.body).to eq_as_json \
          password: [error: :blank]
      end
    end
  end
end

require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe "POST /users/new" do
    it "can create users with valid form data" do
      post users_path, params: {
        user: {
          email: 'user@example.com',
          password: 'test1234'
        }
      }

      expect(response).to redirect_to(root_path)

      expect(User.count).to eq 1
      expect(Credentials.count).to eq 1
    end

    it "errors on invalid form data" do
      post users_path, params: {
        user: {
          email: 'user@example.com',
        }
      }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end

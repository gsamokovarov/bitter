require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it 'email presence' do
      user = User.create email: ''

      expect(user).to be_invalid
    end

    it 'email uniqueness' do
      User.create! email: 'user@example.com'

      another_user = User.create \
        email: 'user@example.com'

      expect(another_user).to be_invalid
      expect(another_user.errors.details[:email]).to eq [
        error: :taken, value: "user@example.com"
      ]
    end
  end
end

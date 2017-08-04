require 'rails_helper'

RSpec.describe Authenticable do
  let(:auth) { User }

  describe '.create_with_credentials' do

    it 'can be created with credentials' do
      expect {
        auth.create_with_credentials \
          email: 'user@example.com',
          password: 'test1234'
      }.to change { [User.count, Credentials.count] }
    end

    it 'cannot be created without credentials' do
      expect {
        auth.create_with_credentials email: 'user@example.com'
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe '#authenticate' do
  end
end

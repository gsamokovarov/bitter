module Authenticable
  extend ActiveSupport::Concern

  included do
    attr_accessor :password

    has_one :credentials, as: :authorizable
  end

  module ClassMethods
    def create_with_credentials(attributes = {})
      password = attributes.delete(:password)

      transaction do
        create!(attributes) do |record|
          Credentials.create!(password: password, authorizable: record)
        end
      end
    end
  end

  def authenticate(password)
    credentials.authenticate(password)
  end
end

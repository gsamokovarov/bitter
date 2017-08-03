class Credentials < ApplicationRecord
  has_secure_password

  belongs_to :authorizable, polymorphic: true
end

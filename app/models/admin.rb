class Admin < ApplicationRecord
  include Authenticable

  validates :email, presence: true, uniqueness: true
end

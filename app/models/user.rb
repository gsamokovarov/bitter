class User < ApplicationRecord
  include Authenticable

  has_many :posts
  has_many :comments, through: :posts

  validates :email, presence: true, uniqueness: true
end

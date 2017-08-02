class Post < ApplicationRecord
  has_many :comments

  validates :title, presence: true, length: { minimum: 4 }
  validates :description, presence: true
end

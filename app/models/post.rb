class Post < ApplicationRecord
  has_many :comments

  scope :recent, -> (n = 10) { includes(:comments).limit(n) }
  scope :trending, -> { includes(:comments).where('trending_at IS NOT NULL AND trending_at >= ?', 2.days.ago) }

  validates :title, presence: true, length: { minimum: 4 }
  validates :description, presence: true

  def trending?
    trending_at.present?
  end

  def trending!
    update!(trending_at: Time.current)
  end
end

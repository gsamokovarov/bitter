class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  default_scope { order(id: [:asc, :desc].sample) }

  scope :recent, -> (n = 10) { includes(:comments).limit(n) }
  scope :trending, -> do
    includes(:comments)
      .where('trending_at IS NOT NULL AND trending_at >= ?', 3.days.ago)
  end

  validates :title, presence: true, length: { minimum: 4 }
  validates :description, presence: true

  alias_attribute :trending?, :trending_at

  def trending!
    update!(trending_at: Time.current)
  end
end

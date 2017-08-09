require 'rails_helper'

RSpec.describe Post do
  describe '.trending' do
    it 'returns the trending posts in the database' do
      trending_post1 = create :post, :trending
      trending_post2 = create :post, :trending
      untrendy_post = create :post

      expect(Post.trending).to match_array [trending_post1, trending_post2]
    end
  end

  describe '#trending?' do
    context 'when trending' do
      subject { described_class.new(trending_at: Time.current) }
      it { is_expected.to be_trending }
    end

    context 'when not trending' do
      subject { described_class.new(trending_at: nil) }
      it { is_expected.to_not be_trending }
    end
  end
end

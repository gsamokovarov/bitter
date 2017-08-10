require 'rails_helper'

RSpec.describe Api::PostsController, type: :request do
  describe "POST /api/posts" do
    it "creates post for the user authenticated by the JWT token" do
      user = create :user

      expect {
        post api_posts_path, headers: login(user), params: {
          title: '7 cat behaviours FINALLY explained!',
          description: 'Cats are fun!',
        }
      }.to change { Post.count }.by(+1)

      expect(response).to eq_as_json(
        title: '7 cat behaviours FINALLY explained!',
        text: 'Cats are fun!',
      )
    end
  end
end

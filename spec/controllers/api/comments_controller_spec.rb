require 'rails_helper'

RSpec.describe Api::CommentsController, type: :request do
  describe "POST /api/post/:post_id/comments" do
    it "creates post for the user authenticated by the JWT token" do
      post = create :post

      expect {
        post api_post_comments_path(post),
          headers: login(post.user),
          params: { text: 'You suck!' }
      }.to change { Comment.count }.by(+1)

      expect(response.body).to eq_as_json text: 'You suck!'
    end
  end
end

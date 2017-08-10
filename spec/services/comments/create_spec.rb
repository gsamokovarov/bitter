require 'rails_helper'

RSpec.describe Comments::Create do
  describe "#call" do
    it "creates a comment and send an email to the post author" do
      post = create :post

      comment_creator =
        Comments::Create.new(post, text: 'You suck!')

      # Using mocks, we have to follow 3 simple rules:
      #
      # 1. Don't mock the System Under Test (SUT). This is a fancy way to say,
      #    don't mock the currently tested object.
      #
      # 2. Don't mock objects you don't own, e.g. 3rd party libraries.
      #
      # 3. Don't mock method that are not already tested.
      #    PostMailer.new_comment_mail, for example, isn't tested. If it blows
      #    up, we won't catch the error here.
      expect(PostMailer).to receive_message_chain(:new_comment_mail, :deliver_later)

      comment = comment_creator.call

      expect(comment).to be_valid
    end

    it "can fail with bad input" do
      post = create :post

      expect {
        Comments::Create.new(post, text: '').call
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end

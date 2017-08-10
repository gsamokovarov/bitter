class Comments::Create
  def initialize(post, comment_params)
    @post = post
    @comment_params = comment_params
  end

  def call
    ApplicationRecord.transaction do
      comment = post.comments.create!(comment_params)
      PostMailer.new_comment_mail(post, comment).deliver_later
      comment
    end
  end

  private

  attr_reader :post, :comment_params
end

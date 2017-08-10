class PostMailer < ApplicationMailer
  def new_comment_mail(post, comment)
    @post = post
    @user = post.user
    @comment = comment

    mail to: @user.email
  end
end

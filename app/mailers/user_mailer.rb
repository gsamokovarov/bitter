class UserMailer < ApplicationMailer
  default from: 'user_support@example.com'

  def welcome_mail(user)
    @user = user

    mail to: user.email
  end
end

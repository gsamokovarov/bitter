class ApplicationMailer < ActionMailer::Base
  include Rails.application.routes.url_helpers

  default from: 'hi@example.com'

  layout 'mailer'
end

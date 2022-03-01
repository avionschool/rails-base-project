class ApplicationMailer < ActionMailer::Base
  default from: ENV['USERNAME']
  layout 'mailer'
end

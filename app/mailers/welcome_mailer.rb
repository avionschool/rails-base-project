class WelcomeMailer < ApplicationMailer
  def welcome_send(user)
    @user = user
    mail to: user.email, subject: 'Welcome to Stockjobbers', from: 'noreply@stockjobbers.com'
  end
end

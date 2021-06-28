class WelcomeMailer < ApplicationMailer
  def welcome_send(user)
    @user = user
    mail to: user.email, subject: 'Welcome to Stockjobbers', from: 'noreply@stockjobbers.com'
  end
  def approve_account(user)
   @user = user
   mail to: user.email, subject: 'Welcome to Stockjobbers', from: 'noreply@stockjobbers.com'
  end
  def reject_account(user)
    @user = user
    mail to: user.email, subject: 'Welcome to Stockjobbers', from: 'noreply@stockjobbers.com'
  end
end

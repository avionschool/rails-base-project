class UserMailer < ApplicationMailer
  def welcome_send(user)
    @user = user
    mail to: user.email, subject: 'Welcome to Travel-zilla', from: 'noreply@travelzilla.com'
  end

  def approve_account(user)
    @user = user
    mail to: user.email, subject: 'Travel-zilla Approve account', from: 'noreply@stockjobbers.com'
  end

  def reject_account(user)
    @user = user
    mail to: user.email, subject: 'Travel-zilla Reject Account', from: 'noreply@stockjobbers.com'
  end
end

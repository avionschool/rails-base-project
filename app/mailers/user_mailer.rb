class UserMailer < ApplicationMailer
  def welcome_send(user)
    @user = user
    mail to: user.email, subject: 'Welcome to Travel-zilla', from: 'noreply@travelzilla.com'
  end
end

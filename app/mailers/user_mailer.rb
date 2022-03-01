class UserMailer < ApplicationMailer
  def welcome_email(email)
    mail(to: email, subject: 'Welcome to iStack')
  end

  def registration(email)
    mail(to: email, subject: 'Pending Registration')
  end
end

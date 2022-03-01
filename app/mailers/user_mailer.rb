class UserMailer < ApplicationMailer
  def welcome_email(email)
    mail(to: email, subject: 'Welcome to iStack') if email != nil
  end

  def registration(email)
    mail(to: email, subject: 'Pending Registration') if email != nil
  end
end

class UserMailer < ApplicationMailer
  def welcome_email(email)
    mail(to: email, subject: 'Welcome to iStack') unless email.nil?
  end

  def registration(email)
    mail(to: email, subject: 'Pending Registration') unless email.nil?
  end
end

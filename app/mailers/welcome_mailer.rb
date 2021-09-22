class WelcomeMailer < ApplicationMailer
  def welcome_account_mailer(email)
    mail(to: email, subject: 'Welome to Stock app!')
  end
end
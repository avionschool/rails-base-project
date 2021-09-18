class WelcomeMailer < ApplicationMailer
  def welome_account_email(email)
    mail(to: email, subject: 'Welome to Emporia Wallet!')
  end
end

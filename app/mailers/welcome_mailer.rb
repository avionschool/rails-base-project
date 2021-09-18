class WelcomeMailer < ApplicationMailer
  def welome_account_email
    mail(to: 'emporia.wallet@gmail.com', subject: 'Welome to Emporia Wallet!')
  end
end

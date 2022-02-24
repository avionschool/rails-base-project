class WelcomeMailer < ApplicationMailer
  def welome_account(email)
    mail(to: email, subject: 'Welome to noFomo STA')
  end

  def welcome_account_admin(email)
    mail(to: email, subject: 'Welome to noFomo STA')
  end
end

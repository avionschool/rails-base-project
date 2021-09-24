class ApproveMailer < ApplicationMailer
  def approve_account_mailer(email)
    mail(to: email, subject: 'Account has been admitted!')
  end
end

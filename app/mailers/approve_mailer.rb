class ApproveMailer < ApplicationMailer
  def approve_account_email(email)
    mail(to: email, subject: 'Account has been approved!')
  end
end

class ApproveMailer < ApplicationMailer
  def approve_account(email)
    mail(to: email, subject: 'Your Account has been Approved!')
  end
end

class ApproveMailer < ApplicationMailer
  def approve_account_email
    mail(to: 'emporia.wallet@gmail.com', subject: 'Account has been approved!')
  end
end

class AdminMailer < ApplicationMailer
  default from: 'noreply@stockjobber.com'
  layout 'mailer'

  def new_user_waiting_for_approval(email)
    @email = email
    mail(to: 'admin@stockjobber.com', subject: 'New User Awaiting Admin Approval')
  end
end

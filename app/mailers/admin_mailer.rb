class AdminMailer < ApplicationMailer
  default from: 'noreply@Travelzilla.com'
  layout 'mailer'

  def new_user_waiting_for_approval(user)
    @recipients = Admin.all
    emails = @recipients.collect(&:email).join(',')
    @user = user
    mail(to: emails, subject: 'New User Awaiting Admin Approval')
  end
end

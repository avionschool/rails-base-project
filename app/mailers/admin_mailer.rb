# class AdminMailer < ApplicationMailer
class AdminMailer < Devise::Mailer
  default from: 'from@example.com'
  layout 'mailer'

  def new_user_waiting_for_approval(email)
    @email = email
    mail(to: 'admin@email.com', subject: 'New User Awaiting Admin Approval')
  end
end

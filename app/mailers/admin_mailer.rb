class AdminMailer < Devise::Mailer
  default from: 'pickystocker@gmail.com'
  layout 'mailer'

  def new_user_waiting_for_approval(email)
    @email = email
    mail(to: 'pickystocker@gmail.com', subject: 'New user awaiting admin approval')
  end
end

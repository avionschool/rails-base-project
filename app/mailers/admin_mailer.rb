class AdminMailer < Devise::Mailer
  default from: 'customer_support@bouffage.com'
  layout 'mailer'

  def new_nutritionist_waiting_for_approval(email)
    @email = email
    all_admin = Admin.all
    all_admin.each do |each_admin|
      mail(to: each_admin.email, subject: 'New Doctor Registration Awaiting Admin Approval')
    end
  end
end

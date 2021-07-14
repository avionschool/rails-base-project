class DoctorMailer < ApplicationMailer
  default from: 'customer_support@bouffage.com'
  layout 'mailer'

  def new_nutritionist_account_pending(email)
    @email = email
    mail(to: @email, subject: 'New Doctor Registration Awaiting Admin Approval')
  end

  def new_nutritionist_account_approved(doctor)
    mail(to: doctor.email, subject: 'New Doctor Registration Approved!')
  end
end

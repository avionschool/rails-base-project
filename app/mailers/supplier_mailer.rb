class SupplierMailer < ApplicationMailer
  default from: 'donotreply@hatdog.com'
  layout 'mailer'

  def new_supplier_waiting_for_approval(supplier)
    @supplier = supplier
    mail(to: @supplier.email, subject: 'Account Pending for Approval')
  end

  def new_supplier_approved(supplier)
    @supplier = supplier
    mail(to: @supplier.email, subject: 'Your account has been approved!')
  end
end

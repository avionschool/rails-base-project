class ApproveMailer < ApplicationMailer
  def approve_account_email
    @order = params[:order]

    mail(to: 'emporia.wallet@gmail.com', subject: 'Account has been approved!')
  end
end

class ApproveMailer < ApplicationMailer
  def approve_account_mailer(user)
    @user = user
    mail(to: @user.email, subject: 'Account has been admitted!')
  end
end

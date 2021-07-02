class PendingBrokerMailer < ApplicationMailer
  default from: 'stox.io.community@gmail.com'

  def notify_user
    @user = params[:user]
    mail(to: @user.email, subject: 'Broker Status Update')
  end
end

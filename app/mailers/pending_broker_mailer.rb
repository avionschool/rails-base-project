class PendingBrokerMailer < ApplicationMailer
  default from: 'eunel.soliveres@gmail.com'

  def notify_user
    @user = params[:user]
    mail(to: @user.email, subject: 'Broker Status Update')
  end
end

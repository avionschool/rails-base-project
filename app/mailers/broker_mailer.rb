class BrokerMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def new_broker_account_pending(email)
    @email = email
    mail(to: @email, subject: 'Your Account is Pending for Approval')
  end

  def new_broker_account_approved(broker)
    mail(to: broker.email, subject: 'Congratulations! Your Broker Account is now approved.')
  end
end

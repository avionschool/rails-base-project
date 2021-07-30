class UserMailer < ApplicationMailer
  default from: "avion@trade.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(email)
    mail to: email, subject: "Account approval pending.."
  end
end

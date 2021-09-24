class ApprovedAccountMailer < ApplicationMailer
  def approve_email
    @email = params[:email]
    @url = 'https://trading-app-avion.herokuapp.com'
    mail(to: @email, subject: '[Approved Account] Welcome to Tradify')
  end
end

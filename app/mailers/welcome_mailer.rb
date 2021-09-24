class WelcomeMailer < ApplicationMailer
  def welcome_email
    @email = params[:email]
    @url = 'https://trading-app-avion.herokuapp.com/'
    mail(to: @email, subject: 'Welcome to Tradify')
  end
end

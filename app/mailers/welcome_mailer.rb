class WelcomeMailer < ApplicationMailer
  def welcome_account_mailer
    @email = params[:email]
    @url = 'https://rails-stock-trading-app.herokuapp.com/'
    mail(to: @email, subject: 'Welome to Stock Flame!')
  end
end

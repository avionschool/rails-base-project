class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(
      to: user.email,
      subject: 'Welcome to the Stock On You'
    )
  end

  def confirmation_email(user)
    @user = user
    mail(
      to: user.email,
      subject: 'Welcome to the Stock On You'
    )
  end
end

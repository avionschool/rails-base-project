class UserMailer < ApplicationMailer

  def new_trader_approved
    @user = params[:user]
    mail(to: @user.email, subject: "Your account has been approved!")
  end

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome! Kindly wait for the approval to use the app!")
  end
end

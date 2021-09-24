class UserMailer < ApplicationMailer
  def new_trader_approved
    @user = params[:user]
    mail(to: @user.email, subject: 'WELCOME TO BWINANCE! YOUR ACCOUNT HAS BEEN APPROVED!')
  end

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'THANK YOU FOR REGISTERING FOR BWINANCE! YOUR ACCOUNT IS PENDING FOR APPROVAL!')
  end
end

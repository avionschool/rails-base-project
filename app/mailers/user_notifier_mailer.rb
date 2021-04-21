class UserNotifierMailer < ApplicationMailer
  default :from => 'any_from_address@example.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up at Peddler!' )
  end

  def send_pending_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up at Peddler!' )
  end
  
end

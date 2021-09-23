class RegistrationsController < Devise::RegistrationsController
  def create
    super
    UserMailer.with(user: @user).welcome_email.deliver
  end
end

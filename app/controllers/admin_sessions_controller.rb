class AdminSessionsController < ApplicationController
  def new; end

  def create
    @admin = Admin.find_by(email: params[:email])

    if @admin.present? && @admin.authenticate(params[:password])
      session[:admin_id] = @admin.id
      redirect_to admins_path, notice: 'Logged in successfully'
    else
      redirect_to admins_sign_in_path, alert: 'Invalid email or password'
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to admins_sign_in_path, notice: 'Admin logged out'
  end
end

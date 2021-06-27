class AdminsController < ApplicationController
  def index; end

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      redirect_to root_path, notice: 'Admin was updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    redirect_to root_path, notice: 'Admin account was deleted successfully.'
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :username, :approved, :confirmable, :type)
  end
end

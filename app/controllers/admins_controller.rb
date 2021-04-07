class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @suppliers = Supplier.where(approved: true)
    @buyers = Buyer.all
  end

  def pending_supplier_signup
    @suppliers = Supplier.where(approved: false)
  end

  def approve_supplier_signup
    @supplier = Supplier.find(params[:id])
    @supplier.approved = true
    if @supplier.save
      SupplierMailer.new_supplier_approved(@supplier).deliver
      flash[:notice] = 'Supplier is approved'
      redirect_to admins_path
    else
      flash[:alert] = 'Supplier approve failure'
    end
  end
end

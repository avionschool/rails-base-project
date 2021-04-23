class SuppliersController < ApplicationController
  def show
    @supplier = Supplier.find(params[:id])
    @services = @supplier.services
    pp Paymongo.client
  end
end

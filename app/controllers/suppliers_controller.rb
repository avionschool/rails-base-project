class SuppliersController < ApplicationController
  def show
    @supplier = Supplier.find(params[:id])
  end
end

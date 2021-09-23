class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'porfolios/search' }
        end
      else
        flash[:alert] = 'Please enter a valid symbol to search'
        redirect_to user_homepage_path
        # getting problem showing the alert message problem still not solved
      end
    else
      flash[:alert] = 'Please enter a symbol to search'
      redirect_to user_homepage_path
      # getting problem showing the alert message problem still not solved
    end
  end
end

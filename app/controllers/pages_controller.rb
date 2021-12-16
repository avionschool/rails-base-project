class PagesController < ApplicationController
  def index
    
  end

  def home
    if params[:ticker] == ""
      flash[:notice] = "Please enter stock code"
    elsif params[:ticker]
      @stock = Stock.new
      @logo = Stock.new
      @stock = @stock.render_stock(params[:ticker])
      @logo = @logo.render_logo(params[:ticker])
      if !@stock
        flash[:notice] = "Please enter valid stock code"
      end
    end
  end
  
  private

end
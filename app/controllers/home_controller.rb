class HomeController < ApplicationController
  def index
    #     Redirect to Landing Page
    render :index
  end

  def show
    @portfolio = BuyersStock.where(user_id: current_user.id).where("volume > 0").collect do |x|
      {
        stock_id: x.stock_id,
        name: Stock.find(x.stock_id).name,
        volume: x.volume,
        price: Stock.find(x.stock_id).price,
        code: Stock.find(x.stock_id).code
      }
    end
    @top10 = Stock.most_active
    current_user.admin? ? (redirect_to admin_path) : (render :show)
  end
end

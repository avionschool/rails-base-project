class NutritionistsController < ApplicationController
  before_action :authenticate!
  def show
    @selected_user = Nutritionist.find(params[:id])
    @articles = @selected_user.articles.all.sort_by(&:updated_at).reverse
  end

  def article
    @selected_user = Nutritionist.find(params[:nutritionist_id])
    @article = @selected_user.articles.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:nutritionist_username, :caption, :source_url)
  end
end

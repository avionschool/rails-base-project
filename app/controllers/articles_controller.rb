class ArticlesController < ApplicationController
  before_action :authenticate_nutritionist!

  def index
    @articles = current_nutritionist.articles.all.sort_by(&:updated_at).reverse
  end

  def show
    @cur_user = current_nutritionist
    @article = current_nutritionist.articles.find(params[:id])
  end

  def new
    @article = current_nutritionist.articles.build
  end

  def create
    @article = current_nutritionist.articles.build(article_params)

    if @article.valid?
      @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @article = current_nutritionist.articles.find(params[:id])
  end

  def update
    @article = current_nutritionist.articles.find(params[:id])

    if @article.update(article_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @article = current_nutritionist.articles.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:nutritionist_username, :caption, :source_url)
  end
end

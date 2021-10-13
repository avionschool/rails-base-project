class MainBooksController < ApplicationController
  def index; end

  def new
    @mainbook = MainBook.create
  end

  private

  def mainbooks_params; end
end

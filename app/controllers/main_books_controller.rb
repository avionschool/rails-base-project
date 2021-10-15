class MainBooksController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def mainbook_entries
    @main_books = MainBook.all
  end

  def new
    @main_book = MainBook.new
  end

  def create
    @main_book = MainBook.new(main_book_params)
    if @main_book.save
      redirect_to mainbook_entries_path
    else
      render :new
    end
  end

  def edit
    @main_book = MainBook.find(params[:id])
  end

  def update
    @main_book = MainBook.find(params[:id])
    if @main_book.update(main_book_params)
      flash[:notice] = 'Sucessfully updated Mainbook entry'
      redirect_to mainbook_entries_path
    else
      render :edit
    end
  end

  def destroy_entry
    @main_book = MainBook.find(params[:id])
    if @main_book.destroy
      flash[:notice] = 'Sucessfully deleted Mainbook entry'
      redirect_to mainbook_entries_path
    else
      render :mainbook_entries_path
    end
  end

  private

  def main_book_params
    params.require(:main_book).permit(:user_id, :date_mainb, :mainbook_description, :or_vat_reg_tin_mainb, :debit_mainb, :credit_mainb, :balance_mainb)
  end
end

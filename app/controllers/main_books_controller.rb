class MainBooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: %i[edit update destroy_entry]

  def index; end

  def mainbook_entries
    @main_books = MainBook.all
  end

  def new
    @main_book = current_user.main_books.build
  end

  def create
    @main_book = current_user.main_books.build(main_book_params)
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

  def correct_user
    @main_book = current_user.main_books.find_by(id: params[:id])
    redirect_to mainbook_entries_path, notice: 'Not Authorized to access this page' if @main_book.nil?
  end

  private

  def main_book_params
    params.require(:main_book).permit(:user_id, :date_mainb, :mainbook_description, :or_vat_reg_tin_mainb, :debit_mainb, :credit_mainb, :balance_mainb)
  end
end

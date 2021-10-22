class MinibookEntriesController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def all_minibook_entries
    @minibook_entries = MinibookEntry.all
  end

  def new
    @minibook_entry = MinibookEntry.new
  end

  def create
    @minibook_entry = MinibookEntry.new(minibook_entries_params)
    if @minibook_entry.save
      redirect_to all_minibook_entries_path
    else
      render :new
    end
  end

  def edit_minibook_entry
    @minibook_entry = MinibookEntry.find(params[:id])
  end

  def update
    @minibook_entry = MinibookEntry.find(params[:id])
    if @minibook_entry.update(minibook_entries_params)
      flash[:notice] = 'Sucessfully updated Minibook entry'
      redirect_to all_minibook_entries_path
    else
      render :edit_minibook_entry
    end
  end

  def destroy_entry
    @minibook_entry = MinibookEntry.find(params[:id])
    if @minibook_entry.destroy
      flash[:notice] = 'Sucessfully deleted Minibook Entry'
      redirect_to all_minibook_entries_path
    else
      render :all_minibook_entries_path
    end
  end

  private

  def minibook_entries_params
    params.require(:minibook_entry).permit(:mini_book_id, :date_minib_entry, :minibook_entry_description, :or_vat_reg_tin_mainib, :debit_minib, :credit_minib, :minibook_balance)
  end
end

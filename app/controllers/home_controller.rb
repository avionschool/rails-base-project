class HomeController < ApplicationController
  before_action :authenticate!
  def index
    @nut = Nutritionist.where(approved: false)
    foods = Food.all
    articles = Article.all
    @foods_and_articles = (foods + articles).sort_by(&:updated_at).reverse
  end

  def approve
    doctor = Nutritionist.find(params[:id])
    doctor.approved = true
    doctor.save
    DoctorMailer.new_nutritionist_account_approved(doctor).deliver
    @success = "Doctor's registration approved!"
    redirect_to root_path, notice: @success
  end
end

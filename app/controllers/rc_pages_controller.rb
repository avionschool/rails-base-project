class RcPagesController < ApplicationController
  before_action :authenticate_review_center!

  def home; end

  def new_teacher; end

  def approve_teacher; end
end

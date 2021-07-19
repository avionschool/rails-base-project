class AcommentsController < ApplicationController
  before_action :authenticate!

  def create
    acomment = Acomment.new(acomment_params)
    acomment.commenter = @cur_user.username
    acomment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    acomment = Acomment.find(params[:id])
    acomment.destroy

    redirect_back(fallback_location: root_path)
  end

  private

  def acomment_params
    params.require(:acomment).permit(:body, :article_id)
  end
end

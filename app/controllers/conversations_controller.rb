class ConversationsController < ApplicationController
  def index
    @conversations = current_user.conversations if user_signed_in?
  end

  def show
    @conversation = Conversation.find(params[:id])
    @conversations = current_user.conversations if user_signed_in?
  end

  def new
    @conversation = Conversation.new
  end

  def create
    if Conversation.exists?(conversation_params)
      conv = Conversation.where(conversation_params)
      redirect_to item_conversation_path(params[:item_id], conv.first.id)
    else
      @conversation = Conversation.new(conversation_params)
      @conversation.save
      conv = Conversation.where(conversation_params)
      redirect_to item_conversation_path(params[:item_id], conv.first.id)
    end

    # respond_to do |format|
    #   if @conversation.save
    #     format.html { redirect_to @conversation, notice: "Conversation was successfully created." }
    #     format.json { render :show, status: :created, location: @conversation }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @conversation.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:item_id, :user1_id, :user2_id)
  end
end

class ConversationsController < ApplicationController
    def index
        @conversations = Conversation.all
    end

    def new
        @conversation = Conversation.new
    end

    def create
        @conversation = Conversation.new(conversation_params)
    
        respond_to do |format|
          if @conversation.save
            format.html { redirect_to @conversation, notice: "Conversation was successfully created." }
            format.json { render :show, status: :created, location: @conversation }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @conversation.errors, status: :unprocessable_entity }
          end
        end
      end

      private

      def conversation_params
        params.require(:conversation).permit(:item_id, :user1_id, :user2_id)
      end
end

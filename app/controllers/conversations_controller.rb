class ConversationsController < ApplicationController
    def index
        @conversations = Conversation.all
    end

    def new
        @conversation = Conversation.new
    end

    def create
        if Conversation.exists?(conversation_params)
            redirect_to request.referrer, :alert => 'Conversation exists!'
        else
            @conversation = Conversation.new(conversation_params)
            @conversation.save
            redirect_to request.referrer, :alert => 'New conversation created!'
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

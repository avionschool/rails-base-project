class BuyersController < ApplicationController
    def show
        @buyer = Buyer.find(params[:id])
    end

    def edit
        @buyer = Buyer.find(params[:id])
    end

    def update
        @buyer = Buyer.find(params[:id])
        if @buyer.update(buyer_params)
            redirect_to root_path, notice: 'Buyer was updated successfully.'
        else
            render :edit
        end
    end




    def destroy
        @buyer = Buyer.find(params[:id])
        @buyer.destroy
        redirect_to root_path, notice: 'Buyer account was deleted successfully.'
    end

    

    

    private
    def buyer_params
        params.require(:buyer).permit(:email, :username, :approved, :confirmable, :type)
    end
end

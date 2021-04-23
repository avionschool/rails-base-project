class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
    end

    def update 
        @user = User.update(user_params)
    end
    
    def edit 

    end
    
    private
    def user_params
        params.require(:user).permit(:name, :password)
    end
end

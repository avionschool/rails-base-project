class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if @user.role.downcase == "buyer"
        redirect_to '/dashboard_buyer' 
      elsif @user.role.downcase == "broker"
        if @user.status == "approved"
          redirect_to '/dashboard_broker' 
        else
          flash[:alert] = "Account Not Yet Approved"
          render :new
        end
      elsif @user.role.downcase == "admin"
        redirect_to '/dashboard_admin' 
      else
        flash[:alert] = "Invalid Username or Password"
        render :new
      end
    else
      flash[:alert] = "Invalid Username or Password"
      render :new
    end
  end

  def index_buyer
    if logged_in?
      # code
    else
      redirect_to root_path 
    end
  end

  def index_broker
    if logged_in?
      # code
    else
      redirect_to root_path 
    end
  end

  def index_admin
    if logged_in?
      # code
    else
      redirect_to root_path 
    end
  end

  def login
  end

  def welcome
    if logged_in?
      current_user.role
      if current_user.role.downcase == "buyer"
        redirect_to '/dashboard_buyer' 
      elsif current_user.role.downcase == "broker"
        if current_user.status == "approved"
          redirect_to '/dashboard_broker'
        end
      elsif current_user.role.downcase == "admin"
        redirect_to '/dashboard_admin' 
      else
        redirect_to root_path 
      end
    end
  end

  def out
    session[:user_id] = nil
    redirect_to root_path
  end
end

class SessionsController < ApplicationController
  skip_before_action :authorized, only: %i[new create welcome]

  def new; end

  def create
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      case @user.role.downcase
      when 'buyer'
        redirect_to '/dashboard'
      when 'admin'
        redirect_to '/dashboard_admin'
      end
    else
      flash[:alert] = 'Invalid Username or Password'
      render :new
    end
  end

  def index
    if logged_in?
      @user = User.find_by(id: session[:user_id])
      @user_stocks = BuyerStock.where(user_id: @user.id)
    else
      redirect_to root_path
    end
  end

  def index_admin
    if logged_in?
      @pending_users = User.where(status: 'pending').sort
      @users = User.where(role: 'Buyer').sort

    else
      redirect_to root_path
    end
  end

  def login; end

  def welcome
    return unless logged_in?

    current_user.role
    case current_user.role.downcase
    when 'buyer'
      redirect_to '/dashboard'
    when 'admin'
      redirect_to '/dashboard_admin'
    else
      redirect_to root_path
    end
  end

  def out
    session[:user_id] = nil
    redirect_to root_path
  end

  def approve
    users = User.find_by(id: params[:id])
    PendingBrokerMailer.with(user: users).notify_user.deliver_now
    users.update(status: 'approved', broker_role: 'Broker')
    redirect_to '/dashboard_admin'
  end
end

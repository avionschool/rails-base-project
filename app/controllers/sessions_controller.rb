class SessionsController < ApplicationController
  skip_before_action :authorized, only: %i[new create welcome]

  def new; end

  def create
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      case @user.role.downcase
      when 'buyer'
        redirect_to '/dashboard_buyer'
      when 'broker'
        if @user.status == 'approved'
          redirect_to '/dashboard_broker'
        else
          flash[:alert] = 'Account Not Yet Approved'
          render :new
        end
      when 'admin'
        redirect_to '/dashboard_admin'
      else
        flash[:alert] = 'Invalid Username or Password'
        render :new
      end
    else
      flash[:alert] = 'Invalid Username or Password'
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
      @users = User.where(status: 'pending').sort
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
      redirect_to '/dashboard_buyer'
    when 'broker'
      redirect_to '/dashboard_broker' if current_user.status == 'approved'
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
    users.update(status: 'approved')
    redirect_to '/dashboard_admin'
  end
end

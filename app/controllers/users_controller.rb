class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    if data = RPXNow.user_data(params[:token])
      data = {:name => data[:username], :email => data[:email], :identifier => data[:identifier]}
      self.current_user = User.find_by_identifier(data[:identifier]) || User.create!(data)
      redirect_to '/'
    else
      flash[:error] = :default
      redirect_to :action => :new
    end
  end

  def destroy
    self.current_user = nil
    redirect_to :action => :new
  end
end
class UsersController < ApplicationController
  def index
    
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, notice: "Thank you for signing up to Snedit"
    else
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def show
    
  end
  
  def destroy
    
  end
  
  private
    def current_resource
      @current_resource ||= User.find(params[:id]) if params[:id]
    end
    
    def find_user
      @user = User.find(params[:id])
    end
end

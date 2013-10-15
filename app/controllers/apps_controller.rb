class AppsController < ApplicationController
  before_filter :find_user
  before_filter :find_app, only: [:edit, :update, :destroy, :show]
  
  def index
    @apps = App.readable_by(@user.id)
  end
  
  def new
    @app = @user.apps.new()
  end
  
  def create
    @app = @user.apps.create(params[:app])
    if @app.save
      redirect_to user_app_path(@user,@app)
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @app.update_attributes(params[:app])
      flash[:notice] = 'Application updated'
      redirect_to user_app_path(@user,@app)
    else
      flash.now[:error] = 'Application could not be updated'
      render :edit
    end
  end
  
  def show
  end
  
  def destroy
  end
  
  private
  def find_user
    @user = User.find(params[:user_id])
  end
  
  def find_app
    @app = @user.apps.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Not Authorized!"
    redirect_to root_url
  end
  
  def current_resource
    if params[:id]
      @current_resource ||= App.find(params[:id])
    else
      @current_resource ||= params[:user_id].to_i
    end
  end
  

end
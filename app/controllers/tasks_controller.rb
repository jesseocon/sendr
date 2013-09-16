class TasksController < ApplicationController
  respond_to :json
  def index
    
  end
  
  def new
    @task = Task.new()
  end
  
  def create
    @error = { error: "your task could not be created" }
    @task = Task.new()
    @task.url = params[:url]
    @task.exec_time = params[:exec_time]
    if @task.save
      @task.in_the_future
      respond_with(@task)
    else
      respond_with(@error)
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
end

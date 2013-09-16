class TasksController < ApplicationController
  
  def index
    
  end
  
  def new
    @task = Task.new()
  end
  
  def create
    @task = Task.new(params[:task])
    @task.save
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

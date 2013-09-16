class TasksController < ApplicationController
  
  def index
    
  end
  
  def new
    @task = Task.new()
  end
  
  def create
    @task = Task.new(params[:task])
    if @task.save
      handle_asynchronously :in_the_future, :run_at => Proc.new { @task.exec_time }
    else
      render :new
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

class TasksController < ApplicationController
  respond_to :json
  def index
    @tasks = Task.all
    puts @tasks.inspect
    respond_with @tasks
  end
  
  def new
    @task = Task.new()
  end
  
  def create
    @error = { error: "your task could not be created" }
    @task = Task.new(params[:task])
    if @task.save
      response = @task.in_the_future
      @task.dj_id = response.id
      @task.save
      respond_with(@task)
    else
      respond_with(@error)
    end
  end
  
  def edit
    
  end
  
  def update
    puts "im hitting the controller"
    @error = { error: "your task could not be created" }
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      response = @task.in_the_future
      @task.dj_id = response.id
      @task.save
      respond_with(@task)
    else
      respond_with(@error)
    end
      
  end
  
  def show 
    
  end
  
  def destroy
    
  end
end

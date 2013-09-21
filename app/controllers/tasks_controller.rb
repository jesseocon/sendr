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
    @task = Task.new(command_url: CommandUrl.new(url_string: params[:url]))
    @task.url = params[:url] if params[:url]
    @task.exec_time = params[:exec_time]
    @task.method = params[:method] if params[:method]
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

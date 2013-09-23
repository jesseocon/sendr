module Api
  module V1
    class TasksController < ApplicationController
      respond_to :json
      def index
        @tasks = Task.all
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
        @error = { error: "your task could not be created" }
        @task = Task.find(params[:id])
        if @task.update_attributes(params[:task])
          Delayed::Job.find(@task.dj_id).destroy
          response = @task.in_the_future
          @task.dj_id = response.id
          @task.save
          render json: @task
        else
          respond_with(@error)
        end
      end

      def show 
        @task = Task.find(params[:id])
        respond_with(@task)
      end

      def destroy
        @task = Task.find(params[:id])
        dj_id = @task.dj_id
        if @task.destroy
          Delayed::Job.find(dj_id).destroy
          respond_with(@task)
        else
          @error = {"message" => 'could not be destroyed' }
          respond_with(@error.to_json)
        end
      end
    end
  end
end
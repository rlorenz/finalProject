class TasksController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user, only: :destroy

  def create
     
      @task = $current_class.tasks.build(task_params)
      if @task.save
          flash[:success] = "Task added"
          redirect_to $current_class
      else
          redirect_to $current_class
      end
  end
    

  def destroy
      @task.destroy
      flash[:success] = "Congratulations! You have completed an assignment!"
      redirect_to $current_class
  end
    
  private
    def task_params
        params.require(:task).permit(:name, :description, :dueDate)
    end
    
    def correct_user
        @task = $current_class.tasks.find_by(id: params[:id])
    end
end
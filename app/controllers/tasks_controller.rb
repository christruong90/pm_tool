class TasksController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]


  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    task_params = params.require(:task).permit(:description)
    @project = Project.find params[:project_id]
    @task = Task.new task_params
    @task.project = @project
    if @task.save
      redirect_to project_path(@project), notice: "Task Created!"
    else
      render "/projects/show"
    end

  end



  def show
    @task = Task.find params[:id]
  end

  def destroy
    @project = Project.find params[:project_id]
    @task = Task.find params[:id]
    @task.destroy
    redirect_to project_path(@project), notice: "Projetc Deleted"
  end

  def edit
    @task = Task.find params[:id]

  end

end

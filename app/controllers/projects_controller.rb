class ProjectsController < ApplicationController


  def new
    @project = Project.new
  end

  def index
    @projects = Project.order(created_at: :desc).page(params[:page]).per(3)
  end

  def edit
    @project = Project.find params[:id]
  end

  def update
    project_params = params.require(:project).permit(:title, :description, :due_date)
    project = Project.find params[:id]
      if project.update project_params
        redirect_to project_path(project)
      else
        render :edit
      end
  end

  def create
    project_params = params.require(:project).permit(:title, :description, :due_date)
    @project = Project.new project_params
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def search
    if params[:search]
      @projects = Project.all.search(params[:search])
    else
      @requests = Project.all.order('created_at DESC')
    end
  end

  def show
    @project = Project.find params[:id]
    @task = Task.new
  end

  def destroy
    project = Project.find params[:id]
    project.destroy
    redirect_to projects_path
  end

end

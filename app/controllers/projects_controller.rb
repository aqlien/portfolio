class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :destroy]

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      # we'll get to this in a bit
    end
  end

  def new
    @project = Project.new
  end

  def index
    @projects = Project.all
  end

  def show
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, flash[:notice] => "Project has been destroyed."}
      format.json { head :no_content }
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :technologies_used)
  end
end

class ProjectsController < ApplicationController
  # routes => projects#index => index defination
  def index
    # We're calling Project.all because to fetch every project from the database and assigining it to an instance variable called projects so we can use it in our view.
    @projects = Project.all
  end

  # routes => projects#show => show definition
  def show
    # params as something like a dictionary or a map that contains request data, whether it came from the URL, a form or a query string.
    # projects/1
    # params = {"id"=>"1"}
    # params[:id]

    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    # {
    #   "project" =>
    #   {
    #     "name" => "plan a Vacation"
    #   }
    # }

    if @project.save
      flash[:notice] = "Project created successfully!"
      # Flash messages in Rails are a way to pass temporary, short-lived messages from the controller to the view,
      redirect_to projects_path(@project)
    else
      # returns a status of 422
      render :new, status: :unprocessable_entity
    end
  end

  def project_params
    # strong parameters or safety feature it helps you protect your app from unwanted or malicious data
    # in the project controller only allow to use name parameter
    params.require(:project).permit(:name)
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      flash[:notice] = "Project updated successfully"
      redirect_to project_path(@project)
    else
      # returns a status of 422
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @project = Project.find(params[:id])

    @project.destroy
    flash[:notice] = "Project Deleted."
    redirect_to projects_path
  end
end

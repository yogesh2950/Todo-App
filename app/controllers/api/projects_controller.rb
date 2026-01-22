class Api::ProjectsController < Api::BaseController
  def index
    render json: Project.all
  end

  def create
    project = Project.new(project_params)

    if project.save
      render json: project,
      status: :created
    else
      render json: {errors: project.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    project = Project.find(params[:id])

    if project.update(project_params)
      render json: project
    else
      render json: {errors: project.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :active)
  end
end

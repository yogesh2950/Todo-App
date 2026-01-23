class Api::ProjectsController < Api::BaseController
  def index
    # Fetching all project for a particular user

    projects = Project.find_by(user_id: @current_user.id)

    if projects
      render json: {status: true, data: projects}, status: :ok
    else
      render json: {status: false, message: "No Projects Found"}, status: :not_found
    end
  end

  def create
    projects = Project.new(user_id: @current_user.id)
    

    if projects.save
      render json: {status: true, project: projects}, status: :ok
    else
      render json: {status: false, errors: projects.errors.full_messages }, status: :unprocessable_entity
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

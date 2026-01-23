class Api::BaseController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers["Authorization"]
    token = header.split(" ").last
    if header
      begin
        @decode = JsonWebToken.decode(token)
        pp decode
        @current_user = User.find(decode[:user_id])
      rescue
        render json: { error: "Unauthorized" }, status: :Unauthorized
      end

    end
  end
end

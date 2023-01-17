class Api::V1::Users::SessionsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(_resource, _opts = {})
    current_user? ? log_in_success : log_in_failed
  end

  def log_in_success
    render json: { status: 200, message: 'Logged in sucessfully.', data: UserSerializer.new(current_user) }, status: :ok
  end 

  def log_in_failed
    render json: { status: 401, message: "Logged in failed. #{_resource.errors.full_messages.to_sentence}", data: UserSerializer.new(current_user) }, status: :unauthorized
  end
  
  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split.last,
                               ENV.fetch('DEVISE_JWT_SECRET_KEY')).first
      current_user = User.find(jwt_payload['sub'])
      current_user ? log_out_success : log_out_failure
    else
      log_out_failure
    end
  end

  def log_out_success
    render json: { status: 200, message: 'Logged out' }, status: :ok
  end

  def log_out_failure
    render json: {status: 401, message: 'Failed to logged out' }, status: :unauthorized
  end
end

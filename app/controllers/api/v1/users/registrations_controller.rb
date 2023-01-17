class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    resource.persisted? ? register_success : register_failed
  end

  def register_success
    render json: { status: 200, message: 'Signed up sucessfully.', data: UserSerializer.new(current_user) }, status: :ok
  end

  def register_failed
    render json: { status: 422, message: "Signed up failure. #{resource.errors.full_messages.to_sentence}" }, status: :unprocessable_entity
  end
end

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    resource.persisted? ? success : failed
  end

  def success
    render json: { message: 'Signed up' }
  end

  def failed
    render json: { message: 'Failed to sign up' }
  end
end

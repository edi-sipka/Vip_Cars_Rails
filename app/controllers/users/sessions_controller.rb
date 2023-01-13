class Users::SessionsController < Devise::RegistrationsController
    respond_to :json

    private 

        def respond_with(_resource, _opts = {})
            render json: {message: "Logged in", user: current_user}, status: :ok
        end

        def respond_to_on_destroy
            current_user ? log_out_successfully : log_out_failed
        end
    
    def log_out_successfully
        render json: {message: "Logged out"}, status: :ok
    end

    def log_out_failed
        render json: {message: "Failed to logged out"}, status: :unauthorized
        end
    end
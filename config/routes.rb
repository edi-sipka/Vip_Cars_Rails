Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  scope :api, defaults: { format: :json } do  
     scope :v1 do    
        devise_for :users, controllers: {      
          registrations: "api/v1/users/registrations",
               sessions: "api/v1/users/sessions",              },
                   path: "",
                    path_names: {
                      sign_in: "signin",
                        sign_out: "logout",
                        registration: "signup",
                          }   
                        end
                    end

  namespace :api do
    namespace :v1 do
      resources :users do
      resources :reservations
      resources :cars
    end
  end
 end
end

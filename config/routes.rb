Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users,
  controllers: {
    registrations: 'api/v1/users/registrations',
      sessions: 'api/v1/users/sessions'
  }
  namespace :api do
    namespace :v1 do
      resources :cars
      resources :reservations
    end
  end
end

Rails.application.routes.draw do
  root 'root#index'

  namespace :api do
    draw(:api)
  end

  # health check
  get "up" => "rails/health#show", as: :rails_health_check
end

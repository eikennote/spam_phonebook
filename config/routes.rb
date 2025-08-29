Rails.application.routes.draw do
  resources :phone_numbers
  devise_for :users
  get "/", to: "phone_numbers#index"
  get "up" => "rails/health#show", as: :rails_health_check
end

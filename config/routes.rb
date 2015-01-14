Rails.application.routes.draw do
  root 'dashboard#index'
  resources :samples, only: [:create, :index]
end

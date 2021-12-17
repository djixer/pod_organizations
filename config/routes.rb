Rails.application.routes.draw do
  root 'organizations#index'
  get 'organizations/index'
  resources :organizations, only: [:show, :update, :destroy]
end

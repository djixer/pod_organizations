Rails.application.routes.draw do
  root 'organizations#index'
  get 'organizations/index'
  resources :organizations, only: [:show, :update]
  post 'organizations' , to: 'organizations#create', as: :create_organization
end

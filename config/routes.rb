Rails.application.routes.draw do
  root 'organizations#index'
  get 'organizations/index'
  get 'organizations/show'
end

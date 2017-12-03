Rails.application.routes.draw do
  resources :packages, only: %i[index]
  root 'packages#index'
end

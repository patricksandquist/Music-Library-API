Rails.application.routes.draw do
  resources :users, only: [:new, :show, :create]

  root 'users#new'
end

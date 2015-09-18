Rails.application.routes.draw do
  resources :users, only: [:new, :show, :create]
  resource :session, only: [:new, :create, :destroy]

  resources :bands, only: [:show, :index, :create, :new, :edit, :update, :destroy]

  resources :bands, only: :show do
    resources :albums, only: :new
  end

  resources :albums, only: :show do
   resources :tracks, only: :new
  end

  resources :albums, only: [:create, :edit, :show, :update, :destroy]
  resources :tracks, only: [:create, :edit, :show, :update, :destroy]

  root 'users#new'
end

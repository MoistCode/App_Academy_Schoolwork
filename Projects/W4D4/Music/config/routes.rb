Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create]

  resources :bands

  resource :session, only: [:new, :create, :destroy]
end

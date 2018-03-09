Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create]

  resources :bands

  resources :albums

  resources :tracks

  resource :session, only: [:new, :create, :destroy]
end

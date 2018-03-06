Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/artworks', to: 'artworks#show_all_artworks'
  get '/artworks/:id/shared', to:'artworks#show_shares'
  get '/users/:id/shared_with', to:'users#show_shared_with'
  get '/comments', to: 'comments#show_all_comments'

  resources :users, only: [:index, :create, :destroy, :update, :show] do
    resources :artworks, only: [:index, :create, :destroy, :update, :show]
    resources :comments, only: [:index, :create, :destroy, :update, :show]
  end

  resources :artwork_shares, only: [:create, :destroy, :index]


end

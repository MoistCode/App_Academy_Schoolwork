Rails.application.routes.draw do

  get 'goals/new'

  get 'goals/index'

  get 'goals/create'

  get 'goals/destroy'

  get 'goals/show'

  get 'goals/edit'

  get 'goals/update'

  get 'comments/index'

  get 'comments/show'

  get 'comments/new'

  get 'comments/create'

  get 'comments/edit'

  get 'comments/update'

  get 'comments/destroy'

  get 'comments/comment_params'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

resource :session
resources :users
resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

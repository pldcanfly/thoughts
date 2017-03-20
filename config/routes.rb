Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#index"
  get 'impressum', to: 'static_pages#impressum'

  resources :thinkers, path_names: { new: 'register' } do
    resources :thoughts, path_names: { new: 'new' } # TODO: ADD EXCEPT INDEX
  end

  #resources :followers, only: [ :create, :destroy ]
  post 'follow', to: 'followers#create'
  delete 'follow', to: 'followers#destroy'

  get 'love', to: 'loves#index' # TODO: Temporary
  post 'love', to: 'loves#create'
  delete 'love', to: 'loves#destroy'

  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#delete'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end

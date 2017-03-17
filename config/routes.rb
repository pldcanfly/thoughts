Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#index"

  resources :thinkers, path_names: { new: 'register' } # TODO: ADD EXCEPT INDEX
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#delete'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end

Rails.application.routes.draw do

  root :to => "home#index"
  resources :users
  resources :sessions
  match '/logout' => 'sessions#destroy', as: :logout, via: [:delete, :get]

  match '/users/sign_in' => 'sessions#new', via: [:get, :create]
  match '/users/sign_up' => 'users#new', via: [:get, :create]

  resources :attachments
  match "attachments/picture/:id"  => "attachments#picture", :as => "download", via: ['get']

end

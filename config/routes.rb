Rails.application.routes.draw do
  resources :questionaires
  resources :questions
  resources :rooms
  resources :users

  put '/login', to: 'users#login'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  mount ActionCable.server => '/cable'

  resources :messages
  resources :rooms
end

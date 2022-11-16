Rails.application.routes.draw do
  resources :questionaires
  resources :questions
  resources :rooms
  resources :users  
  resources :messages
  resources :rooms

  mount ActionCable.server => '/cable'
end

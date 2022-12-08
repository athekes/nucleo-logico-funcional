Rails.application.routes.draw do
  namespace :administrative do
    resources :questionaires
    resources :questions
    resources :alternatives
  end

  resources :rooms
  get 'find_room/:code', to: 'rooms#find_room'

  resources :users

  mount ActionCable.server => '/cable'
end

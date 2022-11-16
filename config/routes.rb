Rails.application.routes.draw do
  namespace :administrative do
    resources :questionaires
    resources :questions
    resources :alternatives
  end

  resources :rooms
  resources :users
  resources :rooms

  mount ActionCable.server => '/cable'
end

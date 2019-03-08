Rails.application.routes.draw do
  devise_for :users
  root to: 'toppages#index'
  
  resources :books, only: [:index,:show,:new,:destroy]
end

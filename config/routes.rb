Rails.application.routes.draw do

  get 'users/show'

  devise_for :users
  root to: 'toppages#index'
  
  resources :books, only: [:index,:show,:destroy,:new,:create,:update]
  resources :users, only:[:show]
end

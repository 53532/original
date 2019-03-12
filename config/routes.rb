Rails.application.routes.draw do

  get 'books/create'

  devise_for :users
  root to: 'toppages#index'
  
  resources :books, only: [:index,:show,:new,:destroy,:create]
end

Rails.application.routes.draw do

  root to: 'toppages#index'
  devise_for :users
  get 'books/delete_book'
  get 'users/show'
  
  resources :books, only: [:index,:show,:new,:create,:destroy] do
    member do
      post :borrow
      post :back
    end
  end
  resources :users, only:[:show] 
  
end

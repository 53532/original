Rails.application.routes.draw do

  get 'users/show'
  devise_for :users
  root to: 'toppages#index'
  
  resources :books, only: [:index,:show,:destroy,:new,:create] do
    member do
      post :borrow
      post :back
    end
  end
  resources :users, only:[:show] 
  
end

Rails.application.routes.draw do

 root to: 'users#index'
 
 resources :tasks
 get 'signup', to: 'users#new'
 resources :users, only: [:create]
 
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end

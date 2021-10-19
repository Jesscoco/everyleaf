Rails.application.routes.draw do
  get '/search', to: "tasks#search", as: "search_tasks"
  root 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users 
  namespace :admin do 
    resources :users
  end
   #root 'tasks#index'
  resources :tasks
end

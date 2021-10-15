Rails.application.routes.draw do
  get '/search', to: "tasks#search", as: "search_tasks"

  root 'tasks#index'
  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/projects', to: 'projects#index'

  resources :projects do
    resources :todos, only: [:update], to: 'todos#update_todo'
  end
  # get '/projects/:id/todos/:id', to: 'todos#check_todo'
  post '/todos', to: 'todos#create'
end

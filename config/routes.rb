Rails.application.routes.draw do
  root 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
  get '/about', to: 'static_pages#about'
  resources :students
  resources :users
end

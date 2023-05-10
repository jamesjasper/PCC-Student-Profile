Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :students
  root 'sessions#new'
  get '/login', to: 'sessions#new'
  get '/about', to: 'static_pages#about'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end

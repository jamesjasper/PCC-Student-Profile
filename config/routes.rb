Rails.application.routes.draw do
  get 'static_pages/about'
  resources :students
  resources :users
  root 'application#hello'
end

Rails.application.routes.draw do
  resources :students
  resources :users
  root 'application#hello'
end

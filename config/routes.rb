Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
resources :users, :only => [:show]
  root 'pages#index'
  get 'pages/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

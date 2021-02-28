Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  root 'users#index'

  resources :users, :only => [:index, :show]
  resources :communities, :except => [:destroy] do
    resource :user_communities, :only => [:create, :destroy]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

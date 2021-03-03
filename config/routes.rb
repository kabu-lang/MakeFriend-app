Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions:      'users/sessions'
  }
  root 'users#index'

  resources :users, only: [:index, :show]
  resources :communities, except: :destroy do
    resource :user_communities, only: [:create, :destroy]
  end
end

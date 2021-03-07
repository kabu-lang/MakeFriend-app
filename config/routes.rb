Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  get 'likes/index'
  mount ActionCable.server => '/cable'
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions:      'users/sessions'
  }
  root 'users#index'

  resources :users, only: [:index, :show] do
    resource :likes, only: :index
  end

  resources :communities, except: :destroy do
    resource :user_communities, only: [:create, :destroy]
  end
end

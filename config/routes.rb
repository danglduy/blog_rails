Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'master#home'

  get 'help', to: 'master#help'
  get 'about', to: 'master#about'
  get 'contact', to: 'master#contact'

  resources :users, only: [:index, :show, :destroy] do
    member do
      get :following, :followers
    end
  end
  resources :posts do
    resources :comments
  end
  resources :comments do
    resources :comments
  end
  resources :relationships, only: [:create, :destroy]
end

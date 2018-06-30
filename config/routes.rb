Rails.application.routes.draw do
  root 'master#home'
  
  get 'help', to: 'master#help'
  get 'about', to: 'master#about'
  get 'contact', to: 'master#contact'
  
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users
end

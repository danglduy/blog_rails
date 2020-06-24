# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'master#home'

  get 'help', to: 'master#help'
  get 'about', to: 'master#about'
  get 'contact', to: 'master#contact'

  resources :users, only: %i[index show destroy] do
    resources :following, only: :index
    resources :followers, only: :index
  end

  resources :posts do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  resources :relationships, only: %i[create destroy]
end

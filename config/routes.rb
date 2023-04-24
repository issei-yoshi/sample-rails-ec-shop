# frozen_string_literal: true

Rails.application.routes.draw do
  # resources :tasks
  root 'items#index'
  resources :items, only: %i[index show]
  resources :carts, only: %i[show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

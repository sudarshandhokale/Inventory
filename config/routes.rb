Rails.application.routes.draw do
  resources :store_items

  resources :store_categories

  resources :store_types

  resources :stores

  root 'home#index'

  devise_for :users
end

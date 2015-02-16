Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { registrations: :registrations\
  , sessions: :sessions }
  resources :home
  resources :store_categories do
    collection do
      get :store_categories
    end
    member do
      get :store_category
    end
  end
  resources :stores do
    collection do
      get :stores
    end
    member do
      get :store
    end
  end
  resources :store_items do
    collection do
      get :store_items
      get :store
    end
    member do
      get :store_item
    end
  end
end

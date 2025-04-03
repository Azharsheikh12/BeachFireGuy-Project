Rails.application.routes.draw do
  get 'services/new'
  get 'term_services/index'
  get 'privacy_policies/index'
  get 'faqs/index'
  get 'service_locations/index'
  get 'checkout/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, skip: [:registrations]
  # devise_for :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get '/add_to_cart/:product_addons_id/:cart_id/:product_type' => 'carts#add_to_cart', :as => 'add_to_cart'
  get '/remove_to_cart/:product_addons_id/:cart_id/:product_type' => 'carts#remove_to_cart', :as => 'remove_to_cart'
  get '/delete_item/:product_addons_id/:cart_id/:product_type' => 'carts#delete_item', :as => 'delete_item'
  get '/apply_coupen' => 'promo_codes#apply_coupen', :as => 'apply_coupen'
  get '/filter_packages' => 'packages#filter_packages', :as => 'filter_packages'

  root "services#new"
  resources :locations
  resources :packages
  resources :products
  resources :users
  resources :carts
  resources :orders
  resources :galleries 
  resources :contacts
  resources :privacy_policies, only: [:index]
  resources :term_services, only: [:index]
  resources :services, only: [:new , :create]

get '/services/search', to: 'services#search'

# config/routes.rb
require 'sidekiq/web'
mount Sidekiq::Web => '/sidekiq'

end
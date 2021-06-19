Rails.application.routes.draw do
  get 'orders/index'

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :customers, controllers: {
  sessions:      'customer/sessions',
  passwords:     'customer/passwords',
  registrations: 'customer/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

namespace :customer,path: "" do
  root to: 'homes#top'
  get  "home/about"  => "homes#about"
  resources :customers,only: [:show,:edit,:update]
  get "customers/quit" => "customers#quit"
  get "customers/out" => "customers#out"

  resources :cart_products,only:[:index,:update,:create,:destroy]
  delete 'cart_products' => 'all_destroy'
  resources :products,only: [:show,:index]
  resources :orders, only: [:new, :create, :index, :show]
  post 'orders/log' => 'customers#log'
  get 'orders/thanx' => 'orders#thanx'
  resources :deliveries, only: [:index, :create, :destroy, :edit, :update]
end

  namespace :admin  do
    resources :customers, only: [:index,:show, :edit,:update]
    resources :products, only: [:index,:show, :edit,:update, :new, :create]
    resources :genres, only: [:index,:create, :edit,:update]
    resources :orders, only: [:index, :show, :update]
  end
end

Rails.application.routes.draw do
  get 'orders/index'

  devise_for :admins, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
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
  get "customers/quit" => "customers#quit"
  patch "customers/out" => "customers#out"
  resources :customers,only: [:show,:edit,:update]

  delete 'cart_products' => 'cart_products#all_destroy'
  resources :cart_products,only:[:index,:update,:create,:destroy]

  resources :products,only: [:show,:index]
  post 'orders/log' => 'customers#log'
  get 'orders/thanx' => 'orders#thanx'
  resources :orders, only: [:new, :create, :index, :show]
  resources :deliveries, only: [:index, :create, :destroy, :edit, :update]
end

  namespace :admin  do
    resources :customers, only: [:index,:show, :edit,:update]
    resources :products, only: [:index,:show, :edit,:update, :new, :create]
    resources :genres, only: [:index,:create, :edit,:update]
    resources :orders, only: [:index, :show, :update]
  end
end

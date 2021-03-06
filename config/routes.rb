Rails.application.routes.draw do
  namespace :customers do
     get 'customers/:id/confirm' => 'customers#confirm', as: 'customer_confirm'
     patch 'customers/:id/confirm' => 'customers#destroy', as: 'customer_destroy'
      put "customers/:id/hide" => "customers#hide", as: 'customers_hide'
     resources :customers, only: [:new, :show, :edit, :update, :confirm]
     resources :items, only: [:index, :show]
     resources :carts, only: [:index, :create, :update, :destroy]

    delete 'carts' => 'carts#destroy_all'

     resources :orders, only:[:new,:create,:index,:show]
      get 'orders/confirm' => 'orders#confirm'
      post 'orders/confirm' => 'orders#confirm'
     resources :deliveries, only: [:index, :create, :edit, :update, :destroy]

  end


  devise_for :customers

  devise_for :admin, skip: :all
  devise_scope :admin do
    get 'admin/sign_in' => 'admin/sessions#new', as: 'new_admin_session'
    post 'admin/sign_in' => 'admin/sessions#create', as: 'admin_session'
    delete 'admin/sign_out' => 'admin/sessions#destroy', as: 'destroy_admin_session'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :items
    resources :genres
  	resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:create,:index,:show,:update]
    resources :order_items, only: [:update]
    get '/top' => 'homes#top'
  end

  root to: 'customers/items#top'
  get 'home/about' => 'home#about'
  get 'home/thanks' => 'home#thanks'


end

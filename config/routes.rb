Rails.application.routes.draw do
  namespace :customers do
     get 'customers/:id/confirm' => 'customers#confirm', as: 'customer_confirm'
    # patch 'customers/:id/confirm' => 'customers#destroy', as: 'customer_destroy'
      put "customers/:id/hide" => "customers#hide", as: 'customers_hide'
     resources :customers, only: [:new, :show, :edit, :update, :confirm]
     resources :items, only: [:index, :show]
  end

  root 'home#index'
  resources :items, only: [:index, :show]



  resources :carts, only: [:index,:create,:update,:destroy]
  delete '/carts' => 'customers/carts#destroy'

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
  	resources :customers
    get '/top' => 'homes#top'
  end

  root to: 'customers/items#top'
  get 'home/about' => 'home#about'


end

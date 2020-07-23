Rails.application.routes.draw do
  namespace :customers do
     get 'customers/:id/confirm' => 'customers#confirm', as: 'customer_confirm'
    # patch 'customers/:id/confirm' => 'customers#destroy', as: 'customer_destroy'
      put "customers/:id/hide" => "customers#hide", as: 'customers_hide'
     resources :customers, only: [:new, :show, :edit, :update, :confirm]
     resources :items, only: [:index, :show]
<<<<<<< HEAD
     resources :carts, only: [:index, :create, :update, :destroy]
     delete '/carts' => 'customers/carts#destroy_all'

  end

  
  resources :carts, only: [:index, :create, :update, :destroy]
  
  delete '/carts' => 'customers/carts#destroy_all'
=======
     resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
     resources :carts, only: [:index, :create, :update, :destroy]

  end
>>>>>>> ebf4eedcff9f00bd499322b75a395ae6042087d6


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

Rails.application.routes.draw do
  namespace :customers do
     get 'customers/confirm'
     resources :customers, only: [:new, :show, :edit, :update, :confirm] 
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
	resources :customers
  end

  root to: 'home#top'
  get 'home/about' => 'home#about'

end

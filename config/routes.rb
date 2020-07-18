Rails.application.routes.draw do
  namespace :customers do
     get 'customers/confirm'
     resources :customers, only: [:new, :show, :edit, :update, :confirm] 
  end
  
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'profile/show'
  get 'profile/edit'

  root to: 'welcome#index'

  as :user do
    get 'profile/show', :to => 'devise/registrations#edit', :as => :user_root
  end
  
  devise_for :users
  resources :wishlist_products do 
    member do 
      post :add
    end 
  end 
  
  resources :products

  resources :cart_items do
    member do 
      post :add
    end 
  end 
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end

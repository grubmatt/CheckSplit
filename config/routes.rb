Rails.application.routes.draw do
  resources :people
  resources :orders
  resources :sessions
  resources :order_items
 
  get 'signup' => 'people#new', :as => :signup
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout

  root :to => 'sessions#new'
end

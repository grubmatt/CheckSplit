Rails.application.routes.draw do
  resources :people
  resources :orders
 
  get 'user/edit' => 'person#edit', :as => :edit_current_user
  get 'signup' => 'person#new', :as => :signup
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout

  root :to => 'sessions#new'


end

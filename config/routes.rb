Rails.application.routes.draw do
  resources :people
  resources :orders
  resources :sessions
 
  get 'user/edit' => 'person#edit', :as => :edit_current_user
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout

  root :to => 'sessions#new'
end

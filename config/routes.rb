Rails.application.routes.draw do
  resources :sessions
  resources :goals
  resources :payments
  resources :funds
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root :to => 'funds#index'
end

Rails.application.routes.draw do
  resources :venues
  resources :artists
  resources :events
  resources :pages
  resources :sessions
  resources :goals
  resources :payments, :param => :transaction_id
  resources :funds
  resources :users
  resources :uploads

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root :to => 'pages#index'
  #root :to => 'funds#index'
end

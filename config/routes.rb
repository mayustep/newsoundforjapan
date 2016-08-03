Rails.application.routes.draw do
  resources :bookings
  resources :venues
  resources :artists
  resources :events
  resources :pages
  resource :session do
    get :link_calendar, :on => :member
  end
  resources :goals
  resources :payments, :param => :transaction_id
  resources :funds
  resources :users
  resources :uploads

  get '/auth/:provider/callback', to: 'sessions#create'
  
  root :to => 'pages#index'
  #root :to => 'funds#index'
end

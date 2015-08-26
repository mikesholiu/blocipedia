Rails.application.routes.draw do
  resources :wikis
  resources :subscribers

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  get 'about' => 'welcome#about'

  get '/auth/:provider/callback', to: 'sessions#create'

  put 'cancel_subscription', to: 'subscribers#cancel_subscription'
  
  get 'private_wikis', to: 'wikis#private_wikis'

  root to: 'welcome#index'

end

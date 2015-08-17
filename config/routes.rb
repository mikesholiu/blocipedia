Rails.application.routes.draw do
  resources :wikis
  resources :subscribers

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  get 'about' => 'welcome#about'

  get '/auth/:provider/callback', to: 'sessions#create'
  
  root to: 'welcome#index'

end

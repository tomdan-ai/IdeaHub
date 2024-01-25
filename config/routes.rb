Rails.application.routes.draw do
  put '/update_profile', to: 'users#update_profile'
  put '/update_password', to: 'users#update_password'
  post '/signup', to: 'users#create'
  post '/login', to: 'users#login'

  resources :users do
    resources :articles
    resources :comments
  end

  resources :articles do
    resources :comments
  end

  resources :categories
end

Rails.application.routes.draw do
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

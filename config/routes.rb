Rails.application.routes.draw do
  resources :users do
    resources :articles
    resources :comments
  end

  resources :articles do
    resources :comments
  end

  resources :categories
end

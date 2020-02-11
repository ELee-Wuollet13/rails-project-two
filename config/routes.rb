Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products do
    resources :reviews
  end
  get '/most-reviewed' => 'products#most'
  get '/recent' => 'products#recent'
  get '/america' => 'products#america'
end

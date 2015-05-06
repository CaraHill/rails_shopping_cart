Rails.application.routes.draw do

  get '/products/cart' => 'orders#cart'

  post '/add_to_cart/:id' => 'orders#add_to_cart', as: 'add_to_cart'

  post '/buy_now/:id' => 'orders#buy_now', as: 'buy_now'

  post '/remove_from_cart/:id' => 'orders#remove_from_cart', as: 'remove_from_cart'

  devise_for :customers, controllers: { sessions: "customers/sessions"}
  root 'products#index'
  resources :products

end

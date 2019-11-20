Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post 'purchaser' => 'purchasers#new'
      post 'product' => 'products#new'
      get 'purchasers' => 'purchasers#show'
      get 'products' => 'products#show'
      post 'purchaser-product' => 'purchasers#purchase'
      get 'purchaser/:purchaser_id/product' => 'purchasers#purchases'
      resources :purchasers
      resources :products
    end
  end
end

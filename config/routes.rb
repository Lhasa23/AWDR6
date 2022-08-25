Rails.application.routes.draw do
  resources :carts, only: [:show]
  resources :line_items, only: %i(create update destroy)
  root 'store#index', as: :store_index
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root 'store#index', as: :store_index
  resources :products
  resources :line_items, only: [:create, :update, :destroy]
  resources :carts, only: [:show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

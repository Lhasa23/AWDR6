Rails.application.routes.draw do
  root 'store#index', as: :store_index
  resources :products
  resources :carts, only: [:show, :destroy]
  resources :line_items do
    member do
      get 'refresh'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

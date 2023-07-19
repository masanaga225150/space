Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  resources :users, only: [:edit, :update, :destroy]
  resources :posts do
    resources :comments, only: [:index, :create]
  end
end

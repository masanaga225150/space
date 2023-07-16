Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  get 'signup', to: 'devise/registrations#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  resources :users, only: [:edit, :update]
  resources :posts, only: [:new, :create, :destroy] do
    resources :comments, only: [:index, :create]
  end
end

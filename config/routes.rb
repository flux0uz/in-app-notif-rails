Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :posts do
    resources :comments
  end
  resources :notifications, only: [:index] do
    collection do
      post :mark_as_read
    end
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :users, only: [:show, :index, :create, :update, :destroy] do
    resources :contacts, only: [:index, :create] do
      resources :comments, only: [:index, :create]
    end
    resources :comments, only: [:index, :create]
  end
  resources :contacts, only: [:show, :destroy, :update]
  resources :contact_shares, only: [:show, :index, :create, :destroy]
  resources :comments, only: [:show, :destroy]
end

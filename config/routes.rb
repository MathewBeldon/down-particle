Rails.application.routes.draw do
  resources :columns do
    resources :tasks, only: [:new, :create]
  end

  resources :tasks, only: [:edit, :update, :destroy]
  root to: "home#index"
end
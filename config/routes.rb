Rails.application.routes.draw do

  root to: "users#index"

  devise_for :users

  resources :public_recipes, only: [:index]

  resources :users, only: [:index, :show] do
    resources :foods, only: [:index, :new, :create, :destroy]
    resources :recipes, only:[:index, :new, :show, :create, :destroy]
  end
end

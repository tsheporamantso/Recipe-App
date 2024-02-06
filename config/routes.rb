Rails.application.routes.draw do
  get 'public_recipes/index'
  devise_for :users
  root to: "users#index"

  resources :users, only: [:index, :show] do
    resources :foods, only: [:index, :new, :create, :destroy]
    resources :recipes, only:[:index, :new, :show, :create, :destroy]
    resources :public_recipes, only: [:index]
  end
end

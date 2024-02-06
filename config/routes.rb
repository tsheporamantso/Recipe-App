Rails.application.routes.draw do
  get 'public_recipes/index'
  get 'public_recipes/show'
  root to: "users#index"
  
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :foods, only: [:index, :new, :create, :destroy]
    resources :recipes, only:[:index, :new, :show, :create, :destroy]
  end
end

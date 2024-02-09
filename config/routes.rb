Rails.application.routes.draw do

  root to: "users#index"

  devise_for :users

  resources :public_recipes, only: [:index, :destroy]

  resources :users, only: [:index, :show] do
    resources :foods, only: [:index, :new, :create, :destroy]
    resources :recipes, only:[:index, :new, :show, :create, :destroy, :update] do
      resources :recipe_foods, only: [:index, :show, :new, :create, :destroy]
    end
    resources :general_shopping_list, only: [:index]
  end
end

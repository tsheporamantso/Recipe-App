class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:recipe_foods, recipe_foods: :food).where(public: true)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end

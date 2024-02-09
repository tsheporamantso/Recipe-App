class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes([:user]).where(public: true).order(updated_at: :desc)
    @foods = Food.joins(:recipe_foods).where(user_id: current_user.id)
    @total = 0
    @foods.each do |food|
      @total += food.price
    end
  end

  def destroy
    @recipe = current_user.recipes.includes(:recipe_foods).find(params[:id])
    RecipeFood.where(recipe_id: @recipe.id).destroy_all
    @recipe.destroy

    redirect_to public_recipes_path, notice: 'Recipe was successfully destroyed.'
  end
end

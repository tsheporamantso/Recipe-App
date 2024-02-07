class PublicRecipesController < ApplicationController
  def index
    @p_recipes = Recipe.where(public: true)
    @recipes = Recipe.where(public: true).order(updated_at: :desc)
  end
end

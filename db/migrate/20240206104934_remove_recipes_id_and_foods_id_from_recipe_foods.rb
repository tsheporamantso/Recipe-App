class RemoveRecipesIdAndFoodsIdFromRecipeFoods < ActiveRecord::Migration[7.1]
  def change
    remove_column :recipe_foods, :recipes_id
    remove_column :recipe_foods, :foods_id
    add_reference :recipe_foods, :recipe, foreign_key: true
    add_reference :recipe_foods, :food, foreign_key: true
  end
end

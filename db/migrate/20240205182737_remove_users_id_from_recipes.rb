class RemoveUsersIdFromRecipes < ActiveRecord::Migration[7.1]
  def change
    remove_column :recipes, :users_id
    add_reference :recipes, :user, foreign_key: true
  end
end

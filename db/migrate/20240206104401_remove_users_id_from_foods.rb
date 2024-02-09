class RemoveUsersIdFromFoods < ActiveRecord::Migration[7.1]
  def change
    remove_column :foods, :users_id
    add_reference :foods, :user, foreign_key: true
  end
end

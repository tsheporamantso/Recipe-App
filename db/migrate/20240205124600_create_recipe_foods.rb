class CreateRecipeFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity
      t.references :recipes, foreign_key: { to_table: :recipes }
      t.references :foods, foreign_key: { to_table: :foods }

      t.timestamps
    end
  end
end

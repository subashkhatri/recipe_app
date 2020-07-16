class CreateRecipeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_categories do |t|
      t.integer :recipe_id
      t.integer :category_id
    end
  end
end

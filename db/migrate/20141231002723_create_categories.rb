class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :cat_name
      t.string :cat_description
      t.string :cat_slug
      t.integer :cat_count

      t.timestamps null: false
    end
  end
end

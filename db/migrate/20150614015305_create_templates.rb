class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.string :image
      t.integer :active, :default => 0

      t.timestamps null: false
    end
  end
end

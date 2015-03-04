class CreateUserExts < ActiveRecord::Migration
  def change
    create_table :user_exts do |t|
      t.integer :user_id
      t.string :description
      t.string :description_short
      t.string :photo

      t.timestamps null: false
    end
  end
end

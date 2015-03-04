class CreateDiscusses < ActiveRecord::Migration
  def change
    create_table :discusses do |t|
      t.integer :article_id
      t.integer :user_id
      t.string :dis_body
      t.string :dis_approve

      t.timestamps null: false
    end
  end
end

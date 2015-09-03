class CreateArticleCategories < ActiveRecord::Migration

	def up
		create_table :article_categories do |t|
			t.integer :article_id, limit: 8
			t.integer :category_id, limit: 8
			t.timestamps null: false
		end
	end

	def down
		drop_table :article_categories
		#self.connection.execute "DROP TABLE IF EXISTS article_categories;"
	end

end

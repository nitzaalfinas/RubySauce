class CreateOptions < ActiveRecord::Migration
	def up
		create_table :options do |t|
			t.string :site_title
			t.string :site_description
			t.string :site_domain
			t.text :site_menu
			t.text :site_menu_draft
			t.string :site_keywords
			t.integer :article_size, limit: 8
			t.timestamps null: false
		end
	end

	def down
		drop_table :options 
		#self.connection.execute "DROP TABLE IF EXISTS options;"
	end
end

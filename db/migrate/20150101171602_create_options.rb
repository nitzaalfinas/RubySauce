class CreateOptions < ActiveRecord::Migration
	def up
<<<<<<< HEAD
<<<<<<< HEAD
		self.connection.execute %Q( 
			CREATE TABLE IF NOT EXISTS options (
				id int(11) NOT NULL AUTO_INCREMENT,
        option_key varchar(255) DEFAULT NULL,
        option_value text,
        created_at datetime NOT NULL,
        updated_at datetime NOT NULL,
        PRIMARY KEY (id)
			);
	 	)
=======
=======
>>>>>>> 0a39ba3ed274f01e07c81dee360e999b0777caba
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
<<<<<<< HEAD
>>>>>>> 0a39ba3ed274f01e07c81dee360e999b0777caba
=======
>>>>>>> 0a39ba3ed274f01e07c81dee360e999b0777caba
	end

	def down
		drop_table :options 
		#self.connection.execute "DROP TABLE IF EXISTS options;"
	end
end

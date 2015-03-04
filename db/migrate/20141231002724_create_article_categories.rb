class CreateArticleCategories < ActiveRecord::Migration

	def up
		self.connection.execute %Q( 
			CREATE TABLE article_categories (
				id int(11) NOT NULL AUTO_INCREMENT,
				article_id int(11),
				category_id int(11),
				created_at datetime NOT NULL,
				updated_at datetime NOT NULL,
				PRIMARY KEY (id)
			);	
	 	)
	end

	def down
		self.connection.execute "DROP TABLE IF EXISTS article_categories;"
	end

end
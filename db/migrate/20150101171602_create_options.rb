class CreateOptions < ActiveRecord::Migration
	def up
		self.connection.execute %Q( 
			CREATE TABLE IF NOT EXISTS options (
				id int(11) NOT NULL AUTO_INCREMENT,
			  	site_title varchar(255) DEFAULT NULL,
			  	site_description varchar(255) DEFAULT NULL,
			  	site_domain varchar(255) DEFAULT NULL,
			  	site_menu text,
			  	site_menu_draft text,
			  	created_at datetime NOT NULL,
			  	updated_at datetime NOT NULL,
			  	PRIMARY KEY (id)
			);
	 	)
	end

	def down
		self.connection.execute "DROP TABLE IF EXISTS options;"
	end
end
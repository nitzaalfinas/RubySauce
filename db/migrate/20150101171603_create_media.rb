class CreateMedia < ActiveRecord::Migration
	def up
		self.connection.execute %Q( 
			CREATE TABLE IF NOT EXISTS media (
				id int(11) NOT NULL AUTO_INCREMENT,
				med_storage_name varchar(100) DEFAULT NULL,
				med_url varchar(500) DEFAULT NULL,
			  	med_title varchar(255) DEFAULT NULL,
			  	med_caption varchar(255) DEFAULT NULL,
			  	med_alt varchar(255) DEFAULT NULL,
			  	med_description varchar(255) DEFAULT NULL,
			  	med_author_id int(11) DEFAULT NULL,
			  	gallery int(11) DEFAULT NULL COMMENT 'Pilihan yes atau no',
			  	created_at datetime NOT NULL,
			  	updated_at datetime NOT NULL,
			  	PRIMARY KEY (id)
			);
	 	)
	end

	def down
		self.connection.execute "DROP TABLE IF EXISTS media;"
	end
end
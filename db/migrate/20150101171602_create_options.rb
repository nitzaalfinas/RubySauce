class CreateOptions < ActiveRecord::Migration
	def up
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
	end

	def down
		self.connection.execute "DROP TABLE IF EXISTS options;"
	end
end
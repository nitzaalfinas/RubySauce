class CreateArticles < ActiveRecord::Migration
	def up
		self.connection.execute %Q( 
			CREATE TABLE IF NOT EXISTS articles (
				id int(11) NOT NULL AUTO_INCREMENT,
				title varchar(255) DEFAULT NULL,
				body text,
        author_id int(11) DEFAULT NULL,
        permalink varchar(255) DEFAULT NULL,
        excerp text,
        feat_img varchar(255) DEFAULT NULL,
        comment_status varchar(3) DEFAULT NULL COMMENT 'yes or no',
        publish_status varchar(20) DEFAULT NULL COMMENT 'draft or publish',
        publish_visibility varchar(10) DEFAULT NULL COMMENT 'public or private',
        article_type varchar(10) DEFAULT NULL COMMENT 'article or page',
        article_vcount int(11) DEFAULT NULL COMMENT 'article view count',
        created_at datetime NOT NULL,
        updated_at datetime NOT NULL,
        PRIMARY KEY (id)
			);
	 	)
	end

	def down
		self.connection.execute "DROP TABLE IF EXISTS articles;"
	end
end
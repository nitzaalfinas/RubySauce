class CreateVPages < ActiveRecord::Migration

	def up
		self.connection.execute %Q( 
			CREATE VIEW v_pages AS 
			select
				articles.id,
				articles.title,
				articles.body,
				articles.author_id,
					users.full_name,
					users.nick_name,
				articles.permalink,
				articles.excerp,
				articles.feat_img,
				articles.comment_status,
				articles.publish_status,
				articles.publish_visibility,
				articles.article_type,
				articles.created_at,
				articles.updated_at
			from
				articles
					left join users on articles.author_id = users.id
			where 	
				articles.article_type = 'Page';
	 	)
	end

	def down
		self.connection.execute "DROP VIEW IF EXISTS v_pages;"
	end

end
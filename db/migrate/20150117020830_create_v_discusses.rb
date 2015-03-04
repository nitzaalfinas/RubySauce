class CreateVDiscusses < ActiveRecord::Migration

	def up
		self.connection.execute %Q( 
			CREATE VIEW v_discusses AS 
			select
				discusses.id,
				discusses.article_id,
					articles.title,
					articles.permalink,
					articles.excerp,
					articles.feat_img,
					articles.comment_status,
				discusses.user_id,
					users.email,
					users.full_name,
					users.nick_name,
					users.level,
				discusses.dis_body,
				discusses.dis_approve,
				discusses.created_at,
				discusses.updated_at
			from
				discusses
					left join users on discusses.user_id = users.id
					left join articles on discusses.article_id = articles.id;
	 	)
	end

	def down
		self.connection.execute "DROP VIEW IF EXISTS v_discusses;"
	end

end
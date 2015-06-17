class CreateVArticleCategories < ActiveRecord::Migration
	def up
		self.connection.execute %Q( 
			CREATE VIEW v_article_categories AS 
			select
				article_categories.id,
				article_categories.article_id,
					articles.title,
					articles.body,
					articles.author_id,
						(select full_name from users where users.id = articles.author_id ) as full_name,
						(select nick_name from users where users.id = articles.author_id ) as nick_name,
					articles.permalink,
					articles.excerp,
					articles.feat_img,
					articles.comment_status,
					articles.publish_status,
					articles.publish_visibility,
					articles.article_vcount,
					articles.created_at,
					articles.updated_at,
				article_categories.category_id,
					categories.cat_name,
					categories.cat_slug,
					categories.cat_count,
        concat(articles.title,' ',articles.body,' ',articles.permalink,' ',articles.excerp,' ',categories.cat_name) as article_all
			from
				article_categories
					left join categories on article_categories.category_id = categories.id
					left join articles on article_categories.article_id = articles.id;
	 	)
	end

	def down
		self.connection.execute "DROP VIEW IF EXISTS v_article_categories;"
	end
end
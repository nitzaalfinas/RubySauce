class CreateArticles < ActiveRecord::Migration
	def up
		create_table :articles do |t|
			t.string :title
			t.text :body
			t.integer :author_id, limit: 8
			t.string :permalink
			t.text :excerp
			t.string :feat_img 
			t.string :comment_status, limit: 3, comment: "yes or no"
			t.string :publish_status, limit: 20, comment: "draft or publish"
			t.string :publish_visibility, limit: 10, comment: "public or private"
			t.string :article_type, limit: 10, comment: "article or page"
			t.integer :article_vcount, limit: 8, comment: "article view count"
			t.timestamps null: false 
		end
	end

	def down
		drop_table :articles
		#self.connection.execute "DROP TABLE IF EXISTS articles;"
	end
end

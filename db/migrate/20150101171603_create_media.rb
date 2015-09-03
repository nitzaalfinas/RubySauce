class CreateMedia < ActiveRecord::Migration
	def up
		create_table :media do |t|
			t.string :med_storage_name, limit: 100
			t.string :med_url, limit: 500
			t.string :med_title
			t.string :med_caption
			t.string :med_alt
			t.string :med_description
			t.integer :med_author_id, limit: 8
			t.integer :gallery, limit: 8, comment: "pilihan yes atau no"
			t.timestamps null: false
		end
	end

	def down
		drop_table :media
		#self.connection.execute "DROP TABLE IF EXISTS media;"
	end
end

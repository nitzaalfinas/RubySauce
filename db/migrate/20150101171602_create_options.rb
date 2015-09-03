class CreateOptions < ActiveRecord::Migration
	def up
		create_table :options do |t|
			t.string :option_key
			t.string :option_value
			t.timestamps null: false
		end
	end

	def down
		drop_table :options 
	end
end

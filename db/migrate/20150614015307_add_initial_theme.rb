class AddInitialTheme < ActiveRecord::Migration
  def up
 		Theme.create([
 			{folder_name: "clean_blog", active: 0, created_at: DateTime.now,updated_at: DateTime.now},
 			{folder_name: "default", active: 1, created_at: DateTime.now,updated_at: DateTime.now}
 		])   
  end
 
  def down
  	Theme.delete_all
  end
end

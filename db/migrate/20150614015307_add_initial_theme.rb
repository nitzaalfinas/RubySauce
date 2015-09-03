class AddInitialTheme < ActiveRecord::Migration
  def up
 		Theme.create([
 			{folder_name: "ror_cms", active: 0, created_at: DateTime.now,updated_at: DateTime.now},
 			{folder_name: "ror_cms_2", active: 1, created_at: DateTime.now,updated_at: DateTime.now},
 			{folder_name: "super_simple", active: 0, created_at: DateTime.now,updated_at: DateTime.now},
 			{folder_name: "super_simple_d", active: 0, created_at: DateTime.now,updated_at: DateTime.now}
 		])   
  end
 
  def down
  	# mungkin maksudnya Theme.delete_all ?
  	Theme.delete_all
    #User.delete_all
  end
end

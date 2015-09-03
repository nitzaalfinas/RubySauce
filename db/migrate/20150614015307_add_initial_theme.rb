class AddInitialTheme < ActiveRecord::Migration
<<<<<<< HEAD
<<<<<<< HEAD
  def up   
    self.connection.execute %Q( 
      INSERT INTO `themes` (`id`, `folder_name`, `active`, `created_at`, `updated_at`) VALUES
      (1, 'clean_blog', 0, '0000-00-00 00:00:00', '2015-07-04 07:07:39'),
      (2, 'default', 1, '0000-00-00 00:00:00', '2015-08-30 02:04:04');
	 	)
=======
  def up
 		Theme.create([
 			{folder_name: "ror_cms", active: 0, created_at: DateTime.now,updated_at: DateTime.now},
 			{folder_name: "ror_cms_2", active: 1, created_at: DateTime.now,updated_at: DateTime.now},
 			{folder_name: "super_simple", active: 0, created_at: DateTime.now,updated_at: DateTime.now},
 			{folder_name: "super_simple_d", active: 0, created_at: DateTime.now,updated_at: DateTime.now}
 		])   
>>>>>>> 0a39ba3ed274f01e07c81dee360e999b0777caba
  end
=======
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
>>>>>>> 0a39ba3ed274f01e07c81dee360e999b0777caba
end

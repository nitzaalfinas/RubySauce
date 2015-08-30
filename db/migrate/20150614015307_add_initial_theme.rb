class AddInitialTheme < ActiveRecord::Migration
  def up
    
    self.connection.execute %Q( 
      INSERT INTO `themes` (`id`, `folder_name`, `active`, `created_at`, `updated_at`) VALUES
      (1, 'ror_cms', 0, '0000-00-00 00:00:00', '2015-07-04 07:07:39'),
      (2, 'ror_cms_2', 1, '0000-00-00 00:00:00', '2015-08-30 02:04:04'),
      (3, 'super_simple', 0, '0000-00-00 00:00:00', '2015-07-04 07:04:53'),
      (4, 'super_simple_d', 0, '2015-07-04 07:07:31', '2015-08-30 02:04:03');
	 	)
  end
 
  def down
    User.delete_all
  end
end

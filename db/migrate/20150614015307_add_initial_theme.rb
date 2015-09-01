class AddInitialTheme < ActiveRecord::Migration
  def up   
    self.connection.execute %Q( 
      INSERT INTO `themes` (`id`, `folder_name`, `active`, `created_at`, `updated_at`) VALUES
      (1, 'clean_blog', 0, '0000-00-00 00:00:00', '2015-07-04 07:07:39'),
      (2, 'default', 1, '0000-00-00 00:00:00', '2015-08-30 02:04:04');
	 	)
  end
end

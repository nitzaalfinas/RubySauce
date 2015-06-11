class AddInitialOption < ActiveRecord::Migration
  def up
    Option.create(:site_title => 'RoR-CMS', :site_description => 'CMS based on Ruby on Rails', :site_domain => 'localhost:3000')
  end
 
  def down
    Option.delete_all
  end
end

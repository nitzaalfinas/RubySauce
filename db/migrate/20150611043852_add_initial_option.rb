class AddInitialOption < ActiveRecord::Migration
  def up
    Option.create(option_key: 'site_title', option_value: 'Ruby Sauce')
    Option.create(option_key: 'site_description', option_value: 'CMS based on Ruby on Rails')
    Option.create(option_key: 'site_domain', option_value: 'http://localhost:3000')
    Option.create(option_key: 'site_menu', option_value: '')
    Option.create(option_key: 'site_menu_draft', option_value: '')
    Option.create(option_key: 'site_keywords', option_value: 'cms, ruby, rails, cms based on ruby on rails')
    Option.create(option_key: 'article_size', option_value: 10)
  end
 
  def down
    Option.delete_all
  end
end

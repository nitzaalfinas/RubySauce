class Category < ActiveRecord::Base

	validates :cat_name, presence: true
	validates :cat_slug, presence: true

end

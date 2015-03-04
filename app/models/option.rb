class Option < ActiveRecord::Base
	validates :site_title, presence: true
	validates :site_domain, presence: true
end

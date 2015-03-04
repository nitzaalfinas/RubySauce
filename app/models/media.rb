class Media < ActiveRecord::Base

	validates :med_title, presence: true
	#validates :med_storage_name, presence: true
end
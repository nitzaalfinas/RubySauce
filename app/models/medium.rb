class Medium < ActiveRecord::Base
  self.table_name = 'media'
  
	validates :med_title, presence: true
	#validates :med_storage_name, presence: true
end
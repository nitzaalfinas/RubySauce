class Article < ActiveRecord::Base

	validates :title, presence: true, length: { minimum: 5 }
	validates :permalink, presence: true
	validates :body, presence: true
end

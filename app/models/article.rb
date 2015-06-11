class Article < ActiveRecord::Base

  has_many :article_category
  has_many :category, :through => :article_category
  
	validates :title, presence: true, length: { minimum: 5 }
	validates :permalink, presence: true
	validates :body, presence: true
  
  validates_uniqueness_of :permalink
end

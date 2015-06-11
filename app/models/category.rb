class Category < ActiveRecord::Base

  has_many :article_category
  has_many :article, :through => :article_category
  
	validates :cat_name, presence: true
	validates :cat_slug, presence: true
  validates_uniqueness_of :cat_slug

end

require 'test_helper'

class ArticleCategoryTest < ActiveSupport::TestCase
  
  test "should create article_category" do
    article_category = ArticleCategory.new
    article_category.article_id = articles(:article_first).id
    article_category.category_id = 1
    
    assert article_category.save
  end
   
  test "should find article_category" do
    article_category = article_categories(:arcat_one)
  end
end

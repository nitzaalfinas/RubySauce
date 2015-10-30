require 'test_helper'

class ArticleCategoryTest < ActiveSupport::TestCase
  
  test "should create article_category" do
    article_category = ArticleCategory.new
    article_category.article_id = articles(:article_first).id
    article_category.category_id = 1
    
    assert article_category.save
  end
   
  test "should find article_category" do
    article_category_id = article_categories(:arcat_one).id
    
    assert_nothing_raised do 
      Article.find(article_category_id)
    end
  end
  
  test "should update article_category" do
    article_category = article_categories(:arcat_one)
    assert article_category.update_attributes(article_id: articles(:article_second).id)
  end
  
  test "should destroy article_category" do
    article_category = article_categories(:arcat_two)
    article_category.destroy
    
    assert_raise(ActiveRecord::RecordNotFound) {
      ArticleCategory.find(article_category.id)
    }
  end
  
  
end

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  
  test "should create article" do
    article = Article.new
    article.title = "Test title"
    article.body = "Test body"
    article.author_id = 1
    article.permalink = "test_title"
    article.excerp = "ini adalah excerp"
    article.comment_status = "yes"
    article.publish_status = "publish"
    article.publish_visibility = "public"
    article.article_type = "article"
    article.article_vcount = 1
    
    assert article.save
  end
  
  test "should find article" do
    article_id = Article.where(title: "Ini adalah title kedua").take.id
    
    assert_nothing_raised do 
      Article.find(article_id) 
    end
    
  end
  
  test "should update article" do
    article = Article.where(title: "Ini adalah title kedua").take
    
    assert article.update_attributes(:title => "New Title")
  end
  
  test "should destroy article" do
    article = Article.where(title: "Ini adalah title kedua").take
    article.destroy
    
    assert_raise(ActiveRecord::RecordNotFound) {
      Article.find(article.id)
    }
  end
  
  test "should not create an article without title, permalink nor body" do
    article = Article.new
    assert !article.valid?
    assert article.errors[:title].any?
    assert article.errors[:permalink].any?
    assert article.errors[:body].any?
    assert_equal ["can't be blank", "is too short (minimum is 5 characters)"], article.errors[:title]
    assert_equal ["can't be blank"], article.errors[:permalink]
    assert_equal ["can't be blank"], article.errors[:body]
    assert !article.save
  end
  
end

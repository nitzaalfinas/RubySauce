require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  # should create category
  test "should create category" do
    category = Category.new
    category.cat_name = "Ruby Unique"
    category.cat_description = "Ruby language unique"
    category.cat_slug = "ruby_unique"
    
    assert category.save
  end
  
  # should failed create category because cat_slug is unique
  test "should failed create category because cat_slug is unique" do
    category = Category.new
    category.cat_name = "Ruby"
    category.cat_description = "Ruby"
    category.cat_slug = "ruby"
    
    assert !category.save, "cat slug unique"
  end
  
  # should find category
  test "should find category" do
    category = categories(:cat_one)
    
    assert_nothing_raised do 
      Category.find(category.id) 
    end
  end
  
  #should update category
  test "should update category" do
    category = categories(:cat_one)
    assert category.update_attributes(:cat_name => "New Title")
  end
  
  test "should destroy category" do
    category = categories(:cat_one)
    category.destroy
    
    assert_raise(ActiveRecord::RecordNotFound) {
      Category.find(category.id)
    }
  end
  
end

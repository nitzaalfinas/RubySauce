require 'test_helper'

class ThemeTest < ActiveSupport::TestCase

  test "should create theme" do
    theme = Theme.new
    theme.folder_name = "theme04"
    theme.active = 1
    
    assert theme.save
  end
  
  test "should find theme" do
    theme_id = themes(:one).id
    
    assert_nothing_raised do 
      Theme.find(theme_id) 
    end
  end
  
  test "should update theme" do
    theme = themes(:one)
    assert theme.update_attributes(:folder_name => "theme07")
  end
  
  test "should destroy theme" do
    theme = themes(:one)
    theme.destroy
    
    assert_raise(ActiveRecord::RecordNotFound) {
      Theme.find(theme.id)
    }
  end
  
  
end

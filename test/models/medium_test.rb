require 'test_helper'

class MediumTest < ActiveSupport::TestCase

  test "should create media" do
    medz = Medium.new
    medz.med_storage_name = "testing.jpg"
    medz.med_title = "Coba dengan title"
    medz.med_author_id = users(:udin).id
    
    assert medz.save
  end
  
  test "should find media" do
    id = media(:one).id
    
    assert media(:one)
    
    assert_nothing_raised do 
      Medium.find(id)
    end
  end
  

  test "should update media" do
    medz = media(:one)
    assert medz.update_attributes(:med_description => "Coba ganti")
  end
  

  test "should destroy media" do
    medz = media(:one)
    medz.destroy
    
    assert_raise(ActiveRecord::RecordNotFound) {
      Medium.find(medz.id)
    }
  end
  
  
end

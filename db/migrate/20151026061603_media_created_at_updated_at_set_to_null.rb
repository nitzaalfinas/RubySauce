class MediaCreatedAtUpdatedAtSetToNull < ActiveRecord::Migration
  def change
    change_column(:media, :created_at, :datetime, :null => true)
    change_column(:media, :updated_at, :datetime, :null => true)
  end
end

class ChangeTableMediumName < ActiveRecord::Migration
  def change
    rename_table :medium, :media
  end
end

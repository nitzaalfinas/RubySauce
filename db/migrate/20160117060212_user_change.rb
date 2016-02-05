class UserChange < ActiveRecord::Migration
  def change
  	add_column :users, :level_kode, :string, after: :level
  end
end

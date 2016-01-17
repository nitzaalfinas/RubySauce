class MenuChange < ActiveRecord::Migration
  def change
  	rename_column :menus, :menu_kode, :level_kode
  end
end

class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :menu_kode
      t.text :menu_profil
      t.text :menu_rpjmd
      t.text :menu_visimisi
      t.text :menu_skpd
      t.text :menu_urusan
      t.text :menu_program
      t.text :menu_rka
      t.text :menu_lpj
      t.text :menu_prestasi

      t.timestamps null: false
    end
  end
end

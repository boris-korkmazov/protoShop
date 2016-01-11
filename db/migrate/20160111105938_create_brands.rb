class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.references :manufacturer, index: true, foreign_key: true
      t.string :image_url

      t.timestamps null: false
    end
  end
end

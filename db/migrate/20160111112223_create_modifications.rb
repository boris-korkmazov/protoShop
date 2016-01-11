class CreateModifications < ActiveRecord::Migration
  def change
    create_table :modifications do |t|
      t.references :brand, index: true, foreign_key: true
      t.string :model_motor
      t.string :name
      t.integer :power
      t.decimal :volume_motor, precision: 5, scale: 2
      t.integer :start_production
      t.integer :stop_production

      t.timestamps null: false
    end
  end
end

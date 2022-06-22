class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.references :city, null: false, foreign_key: true
      t.string :name
      t.text :address
      t.bigint :capacity

      t.timestamps
    end
  end
end

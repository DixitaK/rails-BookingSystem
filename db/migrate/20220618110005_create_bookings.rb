class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: :false, foreign_key: true
      t.references :event, null: :false, foreign_key: true
      t.integer :status, default: 2
      t.string :reason
      t.bigint :capacity
      
      t.timestamps
    end
  end
end

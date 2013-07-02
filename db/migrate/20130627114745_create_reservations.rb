class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.integer :restaurant_id
      t.time :reserved_at
      t.date :reserved_on

      t.timestamps
    end
  end
end

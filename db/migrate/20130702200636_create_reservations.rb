class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :reservetime
      t.integer  :restaurant_id
      t.string :status
   	  t.datetime :approved_at
      t.timestamps
    end
  end
end

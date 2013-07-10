class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :username
      t.datetime :reservation_time
      t.timestamps
    end
  end
end

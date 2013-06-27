class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :reserver_name
      t.string :reserver_email
      t.date :reservation_date
      t.time :reservation_time

      t.timestamps
    end
  end
end

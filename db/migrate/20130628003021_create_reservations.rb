class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|

      t.timestamps
    end
  end
end

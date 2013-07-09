class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name

      t.timestamps
    end
  end
end

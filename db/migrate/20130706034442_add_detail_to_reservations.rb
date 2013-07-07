class AddDetailToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :email, :string
    add_column :reservations, :phone, :string
    add_column :reservations, :message, :text
  end
end

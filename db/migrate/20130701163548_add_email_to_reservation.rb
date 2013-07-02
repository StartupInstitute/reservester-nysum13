class AddEmailToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :email, :string
  end
end

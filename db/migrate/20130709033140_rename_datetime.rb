class RenameDatetime < ActiveRecord::Migration
  def change
  	rename_column :reservations, :datetime, :date
  end
end

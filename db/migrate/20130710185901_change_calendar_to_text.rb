class ChangeCalendarToText < ActiveRecord::Migration
  def up
  	change_column :restaurants, :calendar, :text
  end

  def down
  	change_column :restaurants, :calendar, :string
  end
end

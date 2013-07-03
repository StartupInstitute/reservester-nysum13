class DropTest < ActiveRecord::Migration
  def up
  	drop_table :tests
  end

  def down
  end
end

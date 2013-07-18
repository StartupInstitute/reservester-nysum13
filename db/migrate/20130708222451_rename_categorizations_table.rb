class RenameCategorizationsTable < ActiveRecord::Migration
  def up
  	rename_table :categorizations, :categorization 
  end

  def down
  	rename_table :categorization, :categorizations
  end
end

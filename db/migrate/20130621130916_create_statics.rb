class CreateStatics < ActiveRecord::Migration
  def change
    create_table :statics do |t|

      t.timestamps
    end
  end
end

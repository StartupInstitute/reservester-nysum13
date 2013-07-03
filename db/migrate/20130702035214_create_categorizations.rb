class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|

      t.timestamps
    end
  end
end

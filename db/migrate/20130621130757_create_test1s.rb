class CreateTest1s < ActiveRecord::Migration
  def change
    create_table :test1s do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

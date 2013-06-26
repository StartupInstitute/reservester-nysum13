class CreateRests < ActiveRecord::Migration
  def change
    create_table :rests do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end

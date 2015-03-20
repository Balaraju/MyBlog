class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :user_id
      t.float :lattitude
      t.float :longtitude
      t.string :city

      t.timestamps
    end
  end
end

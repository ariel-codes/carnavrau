class CreateBlocks < ActiveRecord::Migration[7.1]
  def change
    create_table :blocks do |t|
      t.string :name
      t.string :starting_point
      t.float :latitude
      t.float :longitude
      t.datetime :starts_at
      t.string :size

      t.timestamps
    end
  end
end

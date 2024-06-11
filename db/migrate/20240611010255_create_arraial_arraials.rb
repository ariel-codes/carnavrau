class CreateArraialArraials < ActiveRecord::Migration[7.1]
  def change
    create_table :arraial_arraials do |t|
      t.string :name
      t.datetime :starts_at
      t.string :address
      t.integer :min_price
      t.string :kind
      t.string :obs

      t.timestamps
    end
  end
end

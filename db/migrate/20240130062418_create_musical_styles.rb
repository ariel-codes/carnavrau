class CreateMusicalStyles < ActiveRecord::Migration[7.1]
  def change
    create_table :musical_styles do |t|
      t.string :name

      t.timestamps
    end
  end
end

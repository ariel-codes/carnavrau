class CreateJoinTableBlocksMusicalStyles < ActiveRecord::Migration[7.1]
  def change
    create_table :block_target_audiences do |t|
      t.references :block, null: false, foreign_key: true
      t.references :target_audience, null: false, foreign_key: true

      t.index [:block_id, :target_audience_id], unique: true

      t.timestamps
    end
  end
end

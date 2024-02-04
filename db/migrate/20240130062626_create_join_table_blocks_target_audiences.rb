class CreateJoinTableBlocksTargetAudiences < ActiveRecord::Migration[7.1]
  def change
    create_table :block_musical_styles do |t|
      t.references :block, null: false, foreign_key: true
      t.references :musical_style, null: false, foreign_key: true

      t.index [:block_id, :musical_style_id], unique: true

      t.timestamps
    end
  end
end

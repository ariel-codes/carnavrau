class CreateJoinTableBlocksTargetAudiences < ActiveRecord::Migration[7.1]
  def change
    create_join_table :blocks, :target_audiences, table_name: "block_musical_styles" do |t|
      t.index [:block_id, :target_audience_id]
      t.index [:target_audience_id, :block_id]
    end
  end
end

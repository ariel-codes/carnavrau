class CreateJoinTableBlocksMusicalStyles < ActiveRecord::Migration[7.1]
  def change
    create_join_table :blocks, :musical_styles, table_name: "block_target_audiences" do |t|
      t.index [:block_id, :musical_style_id]
      t.index [:musical_style_id, :block_id]
    end
  end
end

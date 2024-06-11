class MoveTablesToCarnavalNamespace < ActiveRecord::Migration[7.1]
  def change
    rename_table :blocks, :carnaval_blocks
    rename_table :block_musical_styles, :carnaval_block_musical_styles
    rename_table :block_target_audiences, :carnaval_block_target_audiences
    rename_table :musical_styles, :carnaval_musical_styles
    rename_table :target_audiences, :carnaval_target_audiences
  end
end

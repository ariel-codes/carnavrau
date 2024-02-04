class CreateTargetAudiences < ActiveRecord::Migration[7.1]
  def change
    create_table :target_audiences do |t|
      t.string :name
      t.string :emoji, index: {unique: true}

      t.timestamps
    end
  end
end

class CreateImportedSpreadsheets < ActiveRecord::Migration[7.1]
  def change
    create_table :imported_spreadsheets do |t|
      t.text :response_body

      t.timestamps
    end
  end
end

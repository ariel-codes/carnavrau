class ChangeImportedSpreadsheetResponseBody < ActiveRecord::Migration[7.1]
  def up
    change_column :imported_spreadsheets, :response_body, :binary
  end

  def down
    change_column :imported_spreadsheets, :response_body, :text
  end
end

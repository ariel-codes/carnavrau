class AddUrlToImportedSpreadsheet < ActiveRecord::Migration[7.1]
  def change
    add_column :imported_spreadsheets, :url, :string
  end
end

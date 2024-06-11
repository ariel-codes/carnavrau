class AddTypeToImportedSpreadsheet < ActiveRecord::Migration[7.1]
  def change
    add_column :imported_spreadsheets, :event_type, :string
  end
end

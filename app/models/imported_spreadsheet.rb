class ImportedSpreadsheet < ApplicationRecord
  def to_csv
    @_csv ||= CSV.parse(response_body, headers: true)
  end
end

class ImportedSpreadsheet < ApplicationRecord
  def to_csv
    @_csv ||= CSV.parse(response_body, headers: true)
  end

  def to_spreadsheet
    TmpBinFile
      .new("spreadsheet-#{id}", data: response_body)
      .to_spreadsheet
  end
end

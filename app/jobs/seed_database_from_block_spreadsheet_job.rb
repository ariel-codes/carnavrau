require "csv"

class SeedDatabaseFromBlockSpreadsheetJob < ApplicationJob
  queue_as :internal

  SPREADSHEET_URL = "https://docs.google.com/spreadsheets/d/1qfeq6F2SaaI0fMki2gPI33on1QnYgjrC8BBuD1W21Zg/gviz/tq?tqx=out:csv".freeze

  def perform(download_spreadsheet= true)
    fetch_spreadsheet(download_spreadsheet)
      .to_csv
      .map { map_row(_1) }
      .each { Block.from_csv_row(_1) }
  end

  private

  def map_row(row)
    day = row[1]
    start_time = row[2]
    name = row[3]
    starting_point = row[4]
    musical_styles = row[5]
    target_audiences = row[6]
    size = row[7]

    {day:, start_time:, name:, starting_point:, musical_styles:, target_audiences:, size:}
  end

  def parse_csv(data)
    CSV.parse(data, headers: true)
  end

  def fetch_spreadsheet(download)
    return ImportedSpreadsheet.last if !download && ImportedSpreadsheet.empty?

    response = HTTPX.get(SPREADSHEET_URL)

    case response.status
    when 200
      ImportedSpreadsheet.create!(response_body: response.body.to_s)
    else
      raise "Error fetching spreadsheet: #{response.status}"
    end
  end
end

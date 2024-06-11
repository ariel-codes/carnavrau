class DownloadLatestSpreadsheetJob < ApplicationJob
  queue_as :default

  ARRAIAL_SPREADSHEET_URL = "https://docs.google.com/spreadsheets/d/1ezh1sl97twRz2YE7b8yBhpMznOzuv_5Wu21VHZR31rM/export?format=xlsx".freeze

  def perform(url, event_type)
    response = HTTPX.plugin(:follow_redirects).get(url)

    case (status = response.status)
    when 200...400
      tmp = TmpBinFile.new(url)
      response.body.copy_to(tmp)
      ImportedSpreadsheet.create!(response_body: tmp, event_type:, url:)
    else
      raise "Error fetching spreadsheet: #{status}\n#{response.body}"
    end
  end
end

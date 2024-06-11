class Arraial::UpsertFromSpreadsheetJob < ApplicationJob
  queue_as :default

  def perform
    latest_spreadsheet
      .to_spreadsheet
      .then { _1.sheet(0) }
      .each(**map_headers)
      .then { _1.drop(1) } # drop headers row
      .map { _1.transform_values { |v| v.is_a?(String) ? v.strip.squeeze(" ").gsub(/[\n\t]+/, "\n").presence : v } }
      .map { initialize_row(_1) }
      .each(&:save!)
  end

  private

  def latest_spreadsheet
    @latest_spreadsheet ||= ImportedSpreadsheet.last
  end

  def map_headers
    {date: "DATA", name: "FESTA", time: "HORÁRIO", address: "LOCAL", price: "VALOR", kind: "TIPO", obs: "OBS"}
  end

  def initialize_row(row)
    @last_date = row[:date] if row[:date].present?
    Arraial::Arraial.from_hash({**row, date: @last_date})
  end
end

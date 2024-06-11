class Arraial::Arraial < ApplicationRecord
  nice_enum :kind, %w[school ngo church venue]

  def self.from_hash(row)
    starts_at = "#{row[:date]} #{row[:time]}".in_time_zone("Brasilia")
    min_price = row[:price].match?(/gratuito|off/i) ? 0 : row[:price].match(/R\$\s*(\d+(,\d+)?)/)&.captures&.[](0)&.tr(",", ".")&.to_f
    kind = case row[:kind]
    when /🏫/ then :school
    when /🏡/ then :ngo
    when /⛪/ then :church
    when /🎉/ then :venue
    end

    create_with(address: row[:address], obs: row[:obs], starts_at:, min_price:, kind:)
      .find_or_initialize_by(name: row[:name])
  end
end

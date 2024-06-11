module Carnaval
  class Block < ApplicationRecord
    has_many :block_musical_styles, dependent: :destroy
    has_many :musical_styles, through: :block_musical_styles

    has_many :block_target_audiences, dependent: :destroy
    has_many :target_audiences, through: :block_target_audiences

    SIZE_ENUM = %w[unknown small medium large].freeze
    enum size: SIZE_ENUM.zip(SIZE_ENUM).to_h, _suffix: true

    def self.from_csv_row(row)
      starts_at = "#{row[:day]}/#{Time.zone.today.year} #{row[:start_time]}".in_time_zone("Brasilia")
      size = case row[:size].count("👤")
      when 0
        :unknown
      when 1..2
        :small
      when 3
        :medium
      when (4...)
        :large
      end

      create!({
        name: row[:name], starting_point: row[:starting_point], starts_at:, size:,
        musical_styles: MusicalStyle.from_csv_column(row[:musical_styles]),
        target_audiences: TargetAudience.from_csv_column(row[:target_audiences])
      })
    end
  end
end

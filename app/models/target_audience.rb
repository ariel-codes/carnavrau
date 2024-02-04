class TargetAudience < ApplicationRecord
  def self.from_csv_column(value)
    value.chars.map do |emoji|
      case emoji
      when "🌈"
        find_or_create_by!(emoji: "🏳‍🌈", name: "LGBTQIA+")
      when "👶"
        find_or_create_by!(emoji:, name: "Crianças")
      when "🐶"
        find_or_create_by!(emoji:, name: "Pets")
      end
    end.compact
  end
end

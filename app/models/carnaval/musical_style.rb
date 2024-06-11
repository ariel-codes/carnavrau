module Carnaval
  class MusicalStyle < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    def self.from_csv_column(value)
      styles = value.split(/,|( e )/).map(&:squish) - %w[e ,]
      styles.map do |style|
        find_or_create_by!(name: style)
      end
    end
  end
end

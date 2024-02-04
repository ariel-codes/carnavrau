require "test_helper"

describe Block do
  describe ".from_csv_row" do
    row = {
      name: "Mientras Dura", starting_point: "R. Silva Alvarenga, 619, São Geraldo",
      day: "13/02", start_time: "16h", size: "Médio: 👤👤👤",
      musical_styles: "Techno", target_audiences: "🏳‍🌈"
    }

    it "creates a block from a row of CSV data" do
      block = Block.from_csv_row(row)

      assert_equal "Mientras Dura", block.name
      assert_equal "R. Silva Alvarenga, 619, São Geraldo", block.starting_point
      assert_equal "2024-02-13 16:00".in_time_zone("Brasilia"), block.starts_at
      assert block.medium_size?
      assert_equal ["Techno"], block.musical_styles.map(&:name)
      assert_equal ["LGBTQIA+"], block.target_audiences.map(&:name)
    end
  end
end

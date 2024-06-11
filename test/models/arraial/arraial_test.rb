require "test_helper"

describe Arraial::Arraial do
  describe ".from_hash" do
    row = {
      date: Date.parse("Fri, 07 Jun 2024"),
      name: "Quermesse de Santa Tereza",
      time: "Das 15h às 00h",
      address: "Praça Duque de Caxias, Santa Tereza",
      price: "Gratuito",
      kind: "🏡",
      obs: "Chegue cedo"
    }

    it "creates an Arraial from a hash" do
      arraial = Arraial::Arraial.from_hash(row)
      arraial.save!

      assert_equal "Quermesse de Santa Tereza", arraial.name
      assert_equal "2024-06-07 15:00".in_time_zone("Brasilia"), arraial.starts_at
      assert_equal "Praça Duque de Caxias, Santa Tereza", arraial.address
      assert_equal 0, arraial.min_price
      assert arraial.ngo_kind?
      assert_equal "Chegue cedo", arraial.obs
    end
  end
end

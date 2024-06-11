module Carnaval
  class BlockMusicalStyle < ApplicationRecord
    belongs_to :block
    belongs_to :musical_style
  end
end

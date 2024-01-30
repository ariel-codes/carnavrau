# frozen_string_literal: true

class BlockTargetAudience < ApplicationRecord
  belongs_to :block
  belongs_to :musical_style
end

# frozen_string_literal: true

class BlockMusicalStyle < ApplicationRecord
  belongs_to :block
  belongs_to :musical_style
end

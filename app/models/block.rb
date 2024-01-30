class Block < ApplicationRecord
  has_many :block_musical_styles, dependent: :destroy
  has_many :musical_styles, through: :block_musical_styles

  has_many :block_target_audiences, dependent: :destroy
  has_many :target_audiences, through: :block_target_audiences
end

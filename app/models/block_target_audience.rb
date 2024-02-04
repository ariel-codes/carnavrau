class BlockTargetAudience < ApplicationRecord
  belongs_to :block
  belongs_to :target_audience
end

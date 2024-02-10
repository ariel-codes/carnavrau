class Home::IndexView < ApplicationView
  include ActionView::Helpers::DateHelper

  # @param [Array<Block>] blocks
  def initialize(blocks_by_day:)
    @blocks_by_day = blocks_by_day
  end

  def template
    h2(class: "text-4xl pb-3") { "Programação dos Blocos" }
    ol(class: "flex flex-col gap-2") do
      @blocks_by_day.each do |day, blocks|
        li(class: "flex flex-col gap-2") do
          details do
            summary(class: "text-2xl") { helpers.time_tag(day) }
            ol(class: "flex flex-col gap-4") do
              blocks.each do |block|
                li(class: "border rounded p-2") do
                  # p { helpers.time_ta g(block.starts_at) }
                  # p { block.starting_point }
                end
              end
            end
          end
        end
      end
    end
  end
end

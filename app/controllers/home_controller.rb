# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    blocks_by_day = Block.where("starts_at > ?", Time.zone.now.beginning_of_day - 12.hours)
      .order(:starts_at)
      .select("*, strftime('%d-%m-%Y', starts_at) AS starts_at_day")
      .group_by(&:starts_at_day)
      .transform_keys { Date.parse(_1) }
    render Home::IndexView.new(blocks_by_day:)
  end
end

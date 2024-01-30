# frozen_string_literal: true

class ApplicationLayout < ApplicationView
  include Phlex::Rails::Layout

  def template(&block)
    doctype

    html do
      head do
        title { "Carnavrau" }
        meta name: "viewport", content: "width=device-width,initial-scale=1"
        csp_meta_tag
        csrf_meta_tags

        stylesheet_link_tag "tailwind", "inter-font", data_turbo_track: "reload"
        stylesheet_link_tag "application", data_turbo_track: "reload"

        javascript_importmap_tags
      end

      body do
        main(class: "container mx-auto mt-28 px-5 flex", &block)
      end
    end
  end
end

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

        # For Turbo morphing
        helpers.content_for(:head)

        stylesheet_link_tag "tailwind", "inter-font", data_turbo_track: "reload"
        stylesheet_link_tag "application", data_turbo_track: "reload"

        javascript_importmap_tags

        link rel: "preconnect", href: "https://fonts.gstatic.com"
        link href: "https://fonts.googleapis.com/css2?family=Shrikhand:wght@400&display=swap", rel: "stylesheet"
        link href: "https://fonts.googleapis.com/css2?family=Cabin:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&display=swap", rel: "stylesheet"
      end

      body(class: "h-screen flex flex-col font-['Cabin']") do
        nav(class: "px-4 lg:px-[30vw] py-3 bg-orange-50 dark:bg-amber-900 shadow-md dark:shadow-neutral-50") do
          h1(class: "text-orange-600 dark:text-orange-100 text-3xl font-['Shrikhand']") { "carnavrau.bhz" }
        end
        main(class: "p-4 lg:px-[30vw] grow dark:bg-neutral-900 dark:text-neutral-300 overflow-auto", &block)
      end
    end
  end
end

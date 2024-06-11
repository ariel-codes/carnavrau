module NiceEnum
  extend ActiveSupport::Concern

  class_methods do
    def nice_enum(attribute, values)
      enum attribute => values.zip(values).to_h, :_suffix => true
    end
  end
end

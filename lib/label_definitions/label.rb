module LabelDefinitions
  class Label
    attr_reader :name, :rows, :columns, :width, :height, :row_gutter, :column_gutter,
                :page_size, :page_width, :page_height

    def initialize(attributes = {})
      @name          = attributes.fetch(:name)
      @rows          = attributes.fetch(:rows).to_i
      @columns       = attributes.fetch(:columns).to_i
      @width         = attributes.fetch(:width).to_f
      @height        = attributes.fetch(:height).to_f
      @row_gutter    = attributes.fetch(:row_gutter).to_f
      @column_gutter = attributes.fetch(:column_gutter).to_f
      if attributes.has_key? :page_size
        @page_size   = attributes.fetch(:page_size)
      else
        @page_width  = attributes.fetch(:page_width).to_f
        @page_height = attributes.fetch(:page_height).to_f
      end
    end


  end
end

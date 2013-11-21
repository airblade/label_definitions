module LabelDefinitions
  class Label
    attr_reader :name, :rows, :columns, :width, :height, :row_gutter, :column_gutter

    def initialize(attributes = {})
      @name          = attributes.fetch(:name)
      @rows          = attributes.fetch(:rows).to_i
      @columns       = attributes.fetch(:columns).to_i
      @width         = attributes.fetch(:width).to_f
      @height        = attributes.fetch(:height).to_f
      @row_gutter    = attributes.fetch(:row_gutter).to_f
      @column_gutter = attributes.fetch(:column_gutter).to_f
      @page_width    = attributes.fetch(:page_width).to_f
      @page_height   = attributes.fetch(:page_height).to_f
    end

    def page
      @page ||= Page.new page_width, page_height, page_top_margin, page_left_margin
    end

    private

    def page_width
      @page_width
    end

    def page_height
      @page_height
    end

    def page_top_margin
      ( page_height - (rows * height) - ((rows-1) * row_gutter) ) / 2
    end

    def page_left_margin
      ( page_width - (columns * width) - ((columns-1) * column_gutter) ) / 2
    end

    class Page < Struct.new(:width, :height, :top_margin, :left_margin)
      alias :bottom_margin :top_margin
      alias :right_margin :left_margin
    end
  end
end

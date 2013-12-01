require 'nokogiri'
require_relative 'label'

class OsxContactsImporter
  attr_reader :metrics

  CONTACTS_METRICS = '/Applications/Contacts.app/Contents/Resources/uk.lproj/ABLabelMetrics.plist'

  def initialize(data_string = nil)
    @metrics = data_string || File.read(CONTACTS_METRICS)
  end

  def to_yaml
    labels.map do |label|
      <<END
#{label.name}:
  rows: #{label.rows}
  columns: #{label.columns}
  width: #{label.width}
  height: #{label.height}
  row_gutter: #{label.row_gutter}
  column_gutter: #{label.column_gutter}
  page_width: #{label.page.width}
  page_height: #{label.page.height}
END
    end.join
  end

  def labels
    Nokogiri::XML(metrics).
      xpath('//array/dict/array/dict').
      map do |label|
        new_label Hash[*label.children.reject { |x| x.children.length.zero? }.map(&:text)]
      end.
      compact.
      sort_by(&:name)
  end

  private

  def new_label(hash)
    if name = canonical_name(hash['ABLayoutName'])
      unit = hash['ABUnits'].to_i

      page_height = to_mm hash['ABPaperHeight'], unit
      rows = hash['ABRowCount'].to_i
      top_margin = to_mm hash['ABTopMargin'], unit
      row_gutter = to_mm hash['ABVerticalGutters'], unit
      height = (page_height - 2 * top_margin - (rows - 1 ) * row_gutter).to_f / rows

      page_width = to_mm hash['ABPaperWidth'], unit
      columns = hash['ABColumnCount'].to_i
      left_margin = to_mm hash['ABLeftMargin'], unit
      column_gutter = to_mm hash['ABHorizontalGutters'], unit
      width = (page_width - 2 * left_margin - (columns - 1) * column_gutter).to_f / columns

      LabelDefinitions::Label.new(
        name: name,
        rows: rows,
        columns: columns,
        width: width.round(2),
        height: height.round(2),
        row_gutter: row_gutter.round(2),
        column_gutter: column_gutter.round(2),
        page_width: page_width.round(1),
        page_height: page_height.round(1)
      )
    end
  end

  def canonical_name(name)
    return nil unless name =~ /\A[JL]?\d{4}\z/
    "Avery #{name}"
  end

  def to_mm(val, unit)
    # unit - 1: mm, 2: inch
    unit == 1 ? val.to_f : val.to_f * 25.4
  end
end

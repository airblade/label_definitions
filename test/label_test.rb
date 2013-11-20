require_relative 'helper'
require 'label_definitions/label'

class LabelTest < TestCase

  test 'requires page size or (page width and height)' do
    assert_raises(KeyError) { LabelDefinitions::Label.new attributes }
    assert LabelDefinitions::Label.new(attributes.merge(page_size: 'A4'))
    assert LabelDefinitions::Label.new(attributes.merge(page_width: 42, page_height: 153))
  end

  private

  def attributes
    { name: 'Some label',
      rows: 3,
      columns: 5,
      width: 153,
      height: 42,
      row_gutter: 0,
      column_gutter: 0 }
  end
end


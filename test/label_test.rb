require_relative 'helper'
require 'label_definitions/label'

class LabelTest < TestCase

  test 'page' do
    page = LabelDefinitions::Label.new(attributes.merge(page_width: 200, page_height: 300)).page
    assert_equal 41.0, page.top_margin
    assert_equal 41.0, page.bottom_margin

    assert_equal 17.5, page.left_margin
    assert_equal 17.5, page.right_margin
  end

  private

  def attributes
    { name: 'Some label',
      rows: 5,
      columns: 3,
      width: 53,
      height: 42,
      row_gutter: 2,
      column_gutter: 3 }
  end
end


require_relative 'helper'
require 'label_definitions'

class LabelDefinitionsTest < TestCase

  def setup
    LabelDefinitions.instance_variable_set '@labels', nil
  end

  test 'all' do
    labels = LabelDefinitions.all
    assert_same labels, LabelDefinitions.all  # caching
    assert_equal 8, labels.length
    assert_kind_of LabelDefinitions::Label, labels.first
  end

  test 'find' do
    label = LabelDefinitions.find 'Zweckform 4737'
    assert_equal 9, label.rows
  end

  test 'find alias' do
    label = LabelDefinitions.find 'Zweckform 4784'
    assert_equal 9, label.rows
  end

  test 'add custom label' do
    custom = example_label
    LabelDefinitions.add custom
    label = LabelDefinitions.find 'Custom'
    assert_same custom, label
  end

  test 'add custom label ignores duplicates' do
    LabelDefinitions.add example_label
    count = LabelDefinitions.all.length
    LabelDefinitions.add example_label
    assert_equal count, LabelDefinitions.all.length
  end

  private

  def example_label
    LabelDefinitions::Label.new name: 'Custom',
                                rows: 3,
                                columns: 5,
                                width: 153,
                                height: 42,
                                row_gutter: 0,
                                column_gutter: 0,
                                page_size: 'A4'
  end

end

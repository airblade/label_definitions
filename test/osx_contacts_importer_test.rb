require_relative 'helper'
require 'label_definitions/osx_contacts_importer'

class OsxContactsImporterTest < TestCase

  test 'labels 5160' do
    labels = OsxContactsImporter.new(xml_fixture('5160')).labels
    assert_equal 1, labels.length
    label = labels.first
    assert_equal 'Avery 5160', label.name
    assert_equal 10, label.rows
    assert_equal 3, label.columns
    assert_equal 66.68, label.width
    assert_equal 25.4, label.height
    assert_equal 0, label.row_gutter
    assert_equal 3.18, label.column_gutter
    assert_equal 215.9, label.page.width
    assert_equal 279.4, label.page.height
  end

  test 'yaml 5160' do
    yaml = OsxContactsImporter.new(xml_fixture('5160')).to_yaml
    assert_equal yaml_fixture('5160'), yaml
  end

  test 'labels J8651' do
    labels = OsxContactsImporter.new(xml_fixture('J8651')).labels
    assert_equal 1, labels.length
    label = labels.first
    assert_equal 'Avery J8651', label.name
    assert_equal 13, label.rows
    assert_equal 5, label.columns
    assert_equal 38.1, label.width
    assert_in_delta 21.2, label.height, 0.1
    assert_equal 0, label.row_gutter
    assert_in_delta 2.5, label.column_gutter, 0.1
    assert_equal 210, label.page.width
    assert_equal 297, label.page.height
  end

  test 'yaml J8651' do
    yaml = OsxContactsImporter.new(xml_fixture('J8651')).to_yaml
    assert_equal yaml_fixture('J8651'), yaml
  end

end

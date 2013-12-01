gem 'minitest'
require 'minitest/autorun'

class TestCase < Minitest::Test
  def self.test(name, &block)
    define_method :"test_#{name.inspect}", &block
  end

  def xml_fixture(name)
    fixture name, 'xml'
  end

  def yaml_fixture(name)
    fixture name, 'yaml'
  end

  private

  def fixture(name, ext)
    File.read File.expand_path("../fixtures/#{name}.#{ext}", __FILE__)
  end
end

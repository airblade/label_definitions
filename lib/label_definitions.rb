require 'yaml'
require 'label_definitions/label'
require 'label_definitions/version'

module LabelDefinitions

  def self.all
    @labels ||= begin
      load_definitions.reduce([]) do |labels, (name, definition)|
        symbolize_keys! definition
        labels << Label.new(definition.merge(name: name))
      end
    end
  end

  def self.find(name)
    all.detect { |label| label.name == name }
  end

  # Adds a label definition to the in-memory list.  Does not persist it.
  def self.add(label)
    find(label.name) || (all << label)
  end

  private

  def self.load_definitions
    YAML.load_file File.expand_path('../../labels.yml', __FILE__)
  end

  def self.symbolize_keys!(hash)
    hash.keys.each do |key|
      hash[key.to_sym] = hash.delete key
    end
    hash
  end
end

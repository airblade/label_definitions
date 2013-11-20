# LabelDefinitions

An open source list of label dimensions.

Surprisingly Avery doesn't publish a structured list of their labels.  Even more surprisingly, I can't find a good list on the internet.  So here's a start.

Avery has so many labels that I add them here on an as-needed basis.  Feel free to open a pull request for additional labels.


## Installation

Add this line to your application's Gemfile:

    gem 'label_definitions'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install label_definitions


## Usage

```ruby
# Get all the labels
LabelDefinitions.all
# => [ <Label>, ... ]

# Get a specific label
LabelDefinitions.find 'Avery 5160'
# => <Label @name='Avery 5160', ...>

# Add a custom label (not persisted)
custom = Label.new name: 'Custom', ...
LabelDefinitions.add custom
LabelDefinitions.find 'Custom'
# => <Label @name='Custom', ...>
```


## Intellectual Propery

Copyright 2013 Andrew Stewart, AirBlade Software Ltd.  Released under the MIT licence.

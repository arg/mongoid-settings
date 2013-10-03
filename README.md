# mongoid-settings

A simple gem to store application settings into a MongoDB collection.

[![Gem Version](https://badge.fury.io/rb/mongoid-settings.png)](http://badge.fury.io/rb/mongoid-settings)
[![Build Status](https://travis-ci.org/agladkyi/mongoid-settings.png)](https://travis-ci.org/agladkyi/mongoid-settings)

## Installation

Add this line to your application's Gemfile:

    gem 'mongoid-settings'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid-settings

## Usage

Create a model which includes `Mongoid::Settings`.

    class ApplicationSettings
      include Mongoid::Settings

      setting :some_name, type: String, default: 'some value'
      setting :another
    end

It will allow to use:

    ApplicationSettings.some_name
    => 'some value'

    ApplicationSettings.some_name = 'another value'
    ApplicationSettings.some_name
    => 'another value'

    ApplicationSettings[:another] = 100
    ApplicationSettings[:another]
    => 100

## License

Licensed under the MIT license.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

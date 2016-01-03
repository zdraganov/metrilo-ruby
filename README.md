# Metrilo

Implementation of Metrilo API tracking integration for ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'metrilo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install metrilo

## Configuration

Gem configuration is done as follows:

```ruby
Metrilo.configuration do |config|
  config.api_token    = 'YOUR API TOKEN HERE'
  config.api_secret   = 'YOUR API SECRET HERE'
end
```

API Token and API Secret are mandatory for initialization process of the gem.
Other supported options withing the configuration block are:

```ruby
# ...
config.tracking_url = 'custom_track.merilo.com' # With default options p.metrilo.com
config.js_lib_url   = 'custom_js.metrilo.com' # With default options t.metrilo.com
config.debug_mode   = true # With default options false
# ...
```

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/metrilo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

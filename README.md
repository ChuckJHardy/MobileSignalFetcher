# Mobile Signal Fetcher

Wrapper for the Police UK API.

## Documentation

The [API](http://developer.opensignal.com/) provides a rich data source for information. The API is implemented as a standard JSON web service using HTTP GET and POST requests. Full request and response examples are provided in the documentation.

## Installation

Add this line to your application's Gemfile:

    gem 'mobile-signal-fetcher', bitbucket: 'InsertCoffee/mobile-signal-fetcher'

And then execute:

    $ bundle

## Configuration

    MobileSignalFetcher.configure do |config|
      config.api_key = '123'
      config.verbose = true
    end

* `domain` sets the base uri for Kimonolabs `http://api.opensignal.com/v2/`
* `api_key` sets the OpenSignal API Key `nil`
* `verbose` sets the logger level `false`

## Usage

* `distance` Defaults to `20` (40km x 40km bounding box)
* `network_type` Defaults to `3` (Number indicates network type, 2G, 3G, 4G)

Find Exchange Rate:

    mobile_signal_fetcher = MobileSignalFetcher.new(
      lat: 50.7136820,
      lng: -3.5443600,
      distance: 1,
      network_type: 3
    )
    # => #<MobileSignalFetcher:0x007f985c021f10>

## Testing

Ensure `OPENSIGNAL_API_KEY` environment variable is set when recording VCR cassettes.

    # Includes Rubocop
    $ bin/rspec

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mobile-signal-fetcher/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

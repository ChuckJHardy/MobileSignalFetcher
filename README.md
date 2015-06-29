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

* `distance` Defaults to `10` (Optional) The distance of the edges of the bounding box, in km. So for example if 20 is specified, then averages are returned for an areas enclosed by the bounding box 10km north, south, east and west of the specified point (i.e. 20km x 20km). By default it's set to 10 km, the maximum value is 10.
* `network_type` Defaults to `3` (Optional) By default the API returns results for all technologies. If you wish you can restrict to either 2G, 3G or 4G. Allowed values: 2, 3, or 4.

Find Exchange Rate:

    mobile_signal_fetcher = MobileSignalFetcher.new(
      lat: 50.7136820,
      lng: -3.5443600,
      distance: 1,
      network_type: 3
    )
    # => #<MobileSignalFetcher:0x>

    network_stats = mobile_signal_fetcher.network_stats
    # => #<MobileSignalFetcher::NetworkStats:0x>

    network_stats.networks
    # => [#<MobileSignalFetcher::Network:0x>]

    generations = network_stats.networks.first.generations
    # => #<MobileSignalFetcher::Network::Generation:0x>

    generations.first.type
    # => 4

    generations.first.signal
    # => #<MobileSignalFetcher::Network::Signal:0x>

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

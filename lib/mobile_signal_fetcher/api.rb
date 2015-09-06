require 'faraday'
require 'faraday_middleware'
require 'faraday_middleware/multi_json'

require 'mobile_signal_fetcher/validate'

class MobileSignalFetcher
  class API
    def self.get(*args)
      new.get(*args)
    end

    def get(url:, options: {})
      connection.get(URI.escape(url), options).tap do |response|
        Validate.with(
          method: :get,
          domain: domain,
          url: url,
          options: options,
          response: response
        )
      end
    end

    private

    def domain
      MobileSignalFetcher.configuration.domain
    end

    def verbose?
      MobileSignalFetcher.configuration.verbose
    end

    def connection
      Faraday.new(url: domain) do |faraday|
        faraday.use Faraday::Response::Logger if verbose?

        faraday.response :multi_json,
                         content_type: /\bjson$/,
                         symbolize_keys: true

        faraday.adapter Faraday.default_adapter
      end
    end
  end
end

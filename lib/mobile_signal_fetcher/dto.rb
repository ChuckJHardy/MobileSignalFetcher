require 'mobile_signal_fetcher/api'

class MobileSignalFetcher
  class DTO
    attr_reader :options

    def initialize(options:)
      @options = options
    end

    def self.get(options = {})
      new(options: options).response(:get)
    end

    def response(method)
      log(method: method)
      API.public_send(method, url: endpoint, options: params).body
    end

    def params
      {}
    end

    def endpoint
      fail NotImplementedError, 'Inheriting class must implement'
    end

    private

    def domain
      MobileSignalFetcher.configuration.domain
    end

    def api_key
      MobileSignalFetcher.configuration.api_key
    end

    def log(method:)
      MobileSignalFetcher.configuration.logger.info([
        "-> MobileSignalFetcher Request: #{method.upcase}",
        "domain: #{domain}",
        "endpoint: #{endpoint}",
        "api_key: #{api_key}",
        "params: #{params}"
      ].join("\n")) if MobileSignalFetcher.configuration.log
    end
  end
end

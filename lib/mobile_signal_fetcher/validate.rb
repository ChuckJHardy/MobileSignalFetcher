class MobileSignalFetcher
  class Validate
    def initialize(method:, domain:, url:, options:, response:)
      @method = method
      @domain = domain
      @url = url
      @options = options
      @response = response
    end

    def self.with(*args)
      new(*args).validate
    end

    def validate
      log

      # rubocop:disable Style/RaiseArgs
      fail BadRequest.new(error_args) if bad_request?
      fail EmptyResponse.new(error_args) if empty_response?
      fail NoResults.new(error_args) if no_results?
      # rubocop:enable Style/RaiseArgs

      true
    end

    private

    attr_reader :response

    def error_args
      {
        domain: @domain,
        url: @url,
        options: @options,
        status: response.status,
        body: response.body
      }
    end

    def bad_request?
      response.status == 400
    end

    def no_results?
      networks == 'No results for this area'
    end

    def empty_response?
      !@response.body.has_key?(:networkRank)
    end

    def networks
      @response.body.fetch(:networkRank, [])
    end

    def log
      MobileSignalFetcher.configuration.logger.info(
        "-> MobileSignalFetcher Response: #{@method.upcase}\n#{error_args}"
      ) if MobileSignalFetcher.configuration.log
    end
  end
end

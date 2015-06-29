class MobileSignalFetcher
  NoResults = Class.new(StandardError)
  BadRequest = Class.new(StandardError)

  class Validate
    def initialize(response:)
      @response = response
    end

    def self.using(response)
      new(response: response).validate
    end

    def validate
      fail MobileSignalFetcher::BadRequest if bad_request?
      fail MobileSignalFetcher::NoResults if no_results?
    end

    protected

    attr_reader :response

    private

    def bad_request?
      response.status == 400
    end

    def no_results?
      networks == 'No results for this area'
    end

    def networks
      @response.body.fetch(:networkRank, [])
    end
  end
end

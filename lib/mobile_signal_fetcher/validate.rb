class MobileSignalFetcher
  NoResults = Class.new(StandardError)

  class Validate
    def initialize(response:)
      @response = response
    end

    def self.using(response)
      new(response: response).validate
    end

    def validate
      fail MobileSignalFetcher::NoResults if no_results?
    end

    protected

    attr_reader :response

    private

    def no_results?
      networks == 'No results for this area'
    end

    def networks
      @response.body.fetch(:networkRank)
    end
  end
end

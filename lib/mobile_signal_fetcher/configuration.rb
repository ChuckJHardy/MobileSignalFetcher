class MobileSignalFetcher
  module Configure
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
      configuration
    end

    private

    class Configuration
      attr_accessor :domain, :api_key, :verbose

      def initialize
        self.domain = 'http://api.opensignal.com/v2/'
        self.api_key = nil
        self.verbose = false
      end
    end
  end
end

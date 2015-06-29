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
      attr_accessor :domain, :verbose

      def initialize
        self.domain = 'http://api.opensignal.com/v2/'
        self.verbose = false
      end
    end
  end
end

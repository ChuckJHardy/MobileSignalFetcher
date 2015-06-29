require 'mobile_signal_fetcher/network/generation'

class MobileSignalFetcher
  class Network
    def initialize(network:)
      @network = network
    end

    def self.to_proc
      ->(network) { new(network: network) }
    end

    def generations
      [ gen_for(:type2G), gen_for(:type3G), gen_for(:type4G) ].compact
    end

    private

    def gen_for(type)
      if details = @network[type]
        Generation.new(details: details)
      end
    end
  end
end

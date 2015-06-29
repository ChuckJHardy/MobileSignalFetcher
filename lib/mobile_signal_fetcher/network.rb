require 'mobile_signal_fetcher/network/signal'

class MobileSignalFetcher
  class Network
    def initialize(network:)
      @network = network.fetch(:type3G)
    end

    def self.to_proc
      ->(_, network) { new(network: network) }
    end

    def name
      network.fetch(:networkName) 
    end

    def signal
      Signal.new(network: network)
    end

    protected

    attr_reader :network
  end
end

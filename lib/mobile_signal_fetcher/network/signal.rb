class MobileSignalFetcher::Network
  class Signal
    def initialize(network:)
      @network = network
    end

    def db
      network.fetch(:averageRssiDb)
    end

    protected

    attr_reader :network
  end
end

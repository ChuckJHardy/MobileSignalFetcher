require 'mobile_signal_fetcher/network'

class MobileSignalFetcher
  class NetworkStats
    include Enumerable

    def initialize(stats:)
      @stats = stats
    end

    def each(&block)
      networks.each(&block)
    end

    def networks
      @stats.fetch(:networkRank).map(&MobileSignalFetcher::Network)
    end
  end
end

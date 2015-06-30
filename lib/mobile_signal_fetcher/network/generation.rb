require 'mobile_signal_fetcher/network/signal'

class MobileSignalFetcher::Network
  class Generation
    attr_reader :type

    def initialize(details:)
      @details = details
    end

    def as_hash
      {
        network: name,
        type: type,
        bars: signal.bars
      }
    end

    def name
      details.fetch(:networkName)
    end

    def type
      details.fetch(:networkType)
    end

    def signal
      Signal.new(details: details)
    end

    protected

    attr_reader :details
  end
end

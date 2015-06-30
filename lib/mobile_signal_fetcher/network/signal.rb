require 'mobile_signal_fetcher/network/bars'

class MobileSignalFetcher::Network
  class Signal
    def initialize(details:)
      @details = details
    end

    def db
      @details.fetch(:averageRsrpDb)
    end

    def bars
      Bars.find(db)
    end
  end
end

require 'mobile_signal_fetcher/network/bars'

class MobileSignalFetcher::Network
  class Signal
    def initialize(details:)
      @details = details
    end

    def new_db
      details[:averageRsrpDb]
    end

    def old_db
      details.fetch(:averageRssiDb)
    end

    def bars
      Bars.find(db)
    end

    protected

    attr_reader :details

    private

    def db
      new_db || old_db
    end
  end
end

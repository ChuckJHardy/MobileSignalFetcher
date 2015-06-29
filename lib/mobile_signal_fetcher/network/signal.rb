class MobileSignalFetcher::Network
  class Signal
    def initialize(details:)
      @details = details
    end

    def db
      @details.fetch(:averageRsrpDb)
    end
  end
end

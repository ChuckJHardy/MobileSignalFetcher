class MobileSignalFetcher
  class NetworkStatsDTO < DTO
    def endpoint
      "networkstats.json?lat=#{lat}&lng=#{lng}&distance=#{distance}&network_type=#{network_type}&apikey=#{api_key}&json_format=2"
    end

    private

    def lat
      options.fetch(:lat)
    end

    def lng
      options.fetch(:lng)
    end

    def distance
      options.fetch(:distance)
    end

    def network_type
      options.fetch(:network_type)
    end

    def api_key
      MobileSignalFetcher.configuration.api_key
    end
  end
end

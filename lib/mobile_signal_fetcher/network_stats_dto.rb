class MobileSignalFetcher
  class NetworkStatsDTO < DTO
    def endpoint
      "networkstats.json?lat=#{lat}&lng=#{lng}&distance=#{distance}" \
        "&apikey=#{api_key}&json_format=2" + network_type_query
    end

    private

    def network_type_query
      network_type ? "&network_type=#{network_type}" : ''
    end

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
  end
end

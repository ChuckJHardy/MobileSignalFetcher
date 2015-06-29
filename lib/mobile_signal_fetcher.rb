require 'mobile_signal_fetcher/configuration'
require 'mobile_signal_fetcher/dto'
require 'mobile_signal_fetcher/network_stats_dto'

class MobileSignalFetcher
  extend Configure

  def initialize(lat:, lng:, distance: 20, network_type: 3)
    @lat = lat
    @lng = lng
    @distance = distance
    @network_type = network_type
  end

  def network_stats
    # NetworkStats.new(network_stats_data)
  end

  private

  def network_stats_data
    NetworkStatsDTO.new(
      lat: @lat,
      lng: @lng,
      distance: @distance,
      network_type: @network_type
    )
  end
end

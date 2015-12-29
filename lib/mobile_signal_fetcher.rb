require 'logger'

require 'mobile_signal_fetcher/configuration'
require 'mobile_signal_fetcher/error'
require 'mobile_signal_fetcher/dto'
require 'mobile_signal_fetcher/network_stats_dto'
require 'mobile_signal_fetcher/network_stats'

class MobileSignalFetcher
  extend Configure

  BadRequest = Class.new(Error)
  NoResults = Class.new(Error)
  InvalidResponse = Class.new(Error)
  EmptyResponse = Class.new(Error)

  def initialize(lat:, lng:, distance: 10, network_type: nil)
    @lat = lat
    @lng = lng
    @distance = distance
    @network_type = network_type
  end

  def network_stats
    NetworkStats.new(stats: network_stats_data)
  end

  private

  def network_stats_data
    NetworkStatsDTO.get(
      lat: @lat,
      lng: @lng,
      distance: @distance,
      network_type: @network_type
    )
  end
end

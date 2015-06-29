require 'spec_helper'

RSpec.describe MobileSignalFetcher::NetworkStats do
  let(:instance) { described_class.new(stats: stats) }
  let(:stats) do
    {
      apiVersion: "2",
      latitude: "50.7136820",
      longitude: "-3.5443600",
      distance: 10,
      network_type: "3",
      perMinuteCurrent: 0,
      perMinuteLimit: 10,
      perMonthCurrent: 0,
      perMonthLimit: 2000,
      networkRank: {
        network23430: {
          type3G: {
            networkName: "EE",
            networkId: "23430",
            networkType: "3",
            averageRssiAsu: "10.494025",
            averageRssiDb: "-92.011951",
            sampleSizeRSSI: "320408",
            downloadSpeed: "3313.9091",
            uploadSpeed: "1056.1111",
            pingTime: "136.1364",
            reliability: "98.285714285716"
          }
        },
        network23420: {
          type3G: {
            networkName: "3",
            networkId: "23420",
            networkType: "3",
            averageRssiAsu: "11.792760",
            averageRssiDb: "-89.414480",
            sampleSizeRSSI: "183158",
            downloadSpeed: "5821.8913",
            uploadSpeed: "1521.2250",
            pingTime: "107.1923",
            reliability: "97.7190026954151"
          }
        }
      }
    }
  end

  describe '#each' do
    it 'returns collection of Event objects' do
      instance.each do |obj|
        expect(obj).to be_an_instance_of(MobileSignalFetcher::Network)
      end
    end
  end
end

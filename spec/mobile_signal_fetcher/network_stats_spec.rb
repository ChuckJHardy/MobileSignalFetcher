require 'spec_helper'

RSpec.describe MobileSignalFetcher::NetworkStats do
  let(:instance) { described_class.new(stats: stats) }
  let(:stats) do
    {
      apiVersion: "2",
      latitude: "50.7136820",
      longitude: "-3.5443600",
      distance: "10",
      network_type: "",
      perMinuteCurrent: 1,
      perMinuteLimit: 10,
      perMonthCurrent: 4,
      perMonthLimit: 2000,
      networkRank: [
        {
          networkName: "3",
          networkId: "23420",
          type4G: {
            networkName: "3",
            networkId: "23420",
            networkType: "4",
            averageRsrpAsu: "34.847529",
            averageRsrpDb: "-105.152471",
            sampleSizeRSRP: "383715",
            downloadSpeed: "11740.2941",
            uploadSpeed: "8821.8000",
            pingTime: "59.1111",
            reliability: "94.7368421052632"
          },
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
          },
          type2G: {
            networkName: "3",
            networkId: "23420",
            networkType: "2",
            averageRssiAsu: "8.581667",
            averageRssiDb: "-95.836667",
            sampleSizeRSSI: "1217"
          }
        }
      ]
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

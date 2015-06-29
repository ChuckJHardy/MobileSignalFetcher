require 'spec_helper'

RSpec.describe MobileSignalFetcher::Network::Signal do
  let(:instance) { described_class.new(network: network) }
  let(:network) do
    {
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
  end

  describe '#db' do
    it 'returns network rssi db' do
      expect(instance.db).to eq('-92.011951')
    end
  end
end

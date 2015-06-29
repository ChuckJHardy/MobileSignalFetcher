require 'spec_helper'

RSpec.describe MobileSignalFetcher::Network do
  let(:instance) { described_class.new(network: network) }
  let(:network) do
    {
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
    }
  end

  describe '#name' do
    it 'returns network name' do
      expect(instance.name).to eq('EE')
    end
  end

  describe '#signal' do
    it 'returns Signal object' do
      expect(instance.signal)
        .to be_an_instance_of(MobileSignalFetcher::Network::Signal)
    end
  end
end

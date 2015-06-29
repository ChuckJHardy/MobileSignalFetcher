require 'spec_helper'

RSpec.describe MobileSignalFetcher::Network::Generation do
  let(:instance) { described_class.new(details: details) }
  let(:details) do
    {
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
    }
  end

  describe '#type' do
    it 'returns generation type' do
      expect(instance.type).to eq('4')
    end
  end

  describe '#signal' do
    it 'returns Signal object' do
      expect(instance.signal)
        .to be_an_instance_of(MobileSignalFetcher::Network::Signal)
    end
  end
end

require 'spec_helper'

RSpec.describe MobileSignalFetcher::Network::Signal do
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

  describe '#new_db' do
    it 'returns details rssi db' do
      expect(instance.new_db).to eq(details[:averageRsrpDb])
    end
  end

  describe '#old_db' do
    let(:details) do
      {
        networkName: "3",
        networkId: "23420",
        networkType: "4",
        averageRsrpAsu: "34.847529",
        averageRssiDb: "-105.152471",
        sampleSizeRSRP: "383715",
        downloadSpeed: "11740.2941",
        uploadSpeed: "8821.8000",
        pingTime: "59.1111",
        reliability: "94.7368421052632"
      }
    end

    it 'returns details rssi db' do
      expect(instance.old_db).to eq(details[:averageRssiDb])
    end
  end

  describe '#bars' do
    it 'returns estimated signal bars' do
      expect(instance.bars).to eq(0)
    end
  end
end

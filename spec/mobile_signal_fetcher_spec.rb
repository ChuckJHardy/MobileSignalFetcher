require 'vcr_helper'

RSpec.describe MobileSignalFetcher do
  let(:instance) do
    described_class.new(
      lat: lat, lng: lng, distance: distance, network_type: network_type
    )
  end

  let(:lat) { '52.629729' }
  let(:lng) { '-1.131592' }
  let(:distance) { '1' }
  let(:network_type) { '3' }

  before do
    MobileSignalFetcher.configuration.api_key = ENV['OPENSIGNAL_API_KEY']
  end

  describe '#network_stats' do
    it 'returns NetworkStats object' do
      VCR.use_cassette('valid/network_stats/3g') do
        expect(instance.network_stats)
          .to be_an_instance_of(MobileSignalFetcher::NetworkStats)
      end
    end
  end
end

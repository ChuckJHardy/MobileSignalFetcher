require 'spec_helper'
require 'mobile_signal_fetcher/dto'

describe MobileSignalFetcher::NetworkStatsDTO do
  let(:instance) { described_class.new(options: options) }
  let(:options) { {} }

  describe '#endpoint' do
    let(:expected_endpoint) do
      'networkstats.json'
    end

    it 'returns expected url' do
      expect(instance.endpoint).to eq(expected_endpoint)
    end
  end
end

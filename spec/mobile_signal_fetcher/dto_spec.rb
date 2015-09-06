require 'spec_helper'
require 'mobile_signal_fetcher/dto'

RSpec.describe MobileSignalFetcher::DTO, type: :dto do
  let(:instance) { described_class.new(options: options) }
  let(:options) { {} }

  describe '.get' do
    subject { described_class.get(options) }
    let(:endpoint) { '/endpoint' }

    before do
      allow_any_instance_of(described_class).to receive(:endpoint) { endpoint }

      MobileSignalFetcher.configuration.log = true
      expect(MobileSignalFetcher.configuration.logger).to receive(:info)
    end

    it 'calls off to API and returns response body' do
      expect(MobileSignalFetcher::API).to receive(:get)
        .with(url: endpoint, options: options) { double(body: {}) }

      expect(subject).to eq({})
    end

    after do
      MobileSignalFetcher.configuration.log = false
    end
  end

  describe '#params' do
    it 'returns empty hash' do
      expect(instance.params).to eq({})
    end
  end

  describe '#endpoint' do
    let(:msg) { 'Inheriting class must implement' }

    it 'raises an error' do
      expect { instance.endpoint }.to raise_error(NotImplementedError, msg)
    end
  end
end

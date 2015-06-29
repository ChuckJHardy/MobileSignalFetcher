require 'spec_helper'
require 'mobile_signal_fetcher/api'

RSpec.describe MobileSignalFetcher::API do
  describe '.get' do
    subject { described_class.get(url: url, options: options) }

    let(:url) { '/endpoint/Some Bad URL' }
    let(:options) { { key: 'value' } }

    let(:domain) { MobileSignalFetcher.configuration.domain }
    let(:connection) { double('Faraday') }

    before do
      allow(Faraday).to receive(:new).with(url: domain) { connection }
    end

    context 'when valid' do
      let(:body) { { networkRank: [] } }
      let(:response) do
        instance_double(Faraday::Response, status: 200, body: body)
      end

      it 'calls off to Faraday' do
        expect(connection).to receive(:get)
          .with('/endpoint/Some%20Bad%20URL', options)
          .and_return(response)

        subject
      end
    end

    context 'when invalid' do
      let(:body) { { networkRank: 'No results for this area' } }
      let(:response) do
        instance_double(Faraday::Response, status: 500, body: body)
      end

      it 'raises error' do
        allow(connection).to receive(:get) { response }

        expect { subject }.to raise_error(MobileSignalFetcher::NoResults)
      end
    end
  end
end

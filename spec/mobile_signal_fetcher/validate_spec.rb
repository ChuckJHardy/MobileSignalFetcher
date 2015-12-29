require 'spec_helper'

describe MobileSignalFetcher::Validate do
  def expected_message(exception, status, body)
    expect(exception.message).to eq(
      domain: 'www',
      url: 'example.com',
      options: { query: 1 },
      response: {
        status: status,
        body: body
      }
    )
  end

  subject(:validator) do
    described_class.with(
      method: :get,
      domain: 'www',
      url: 'example.com',
      options: { query: 1 },
      response: response
    )
  end

  let(:response) { double('Faraday::Response', status: status, body: body) }
  let(:body) { { networkRank: [] } }
  let(:status) { 200 }

  before do
    MobileSignalFetcher.configuration.log = true
    expect(MobileSignalFetcher.configuration.logger).to receive(:info)
  end

  it 'returns true when nothing is wrong' do
    expect(validator).to be_truthy
  end

  describe 'When BadRequest' do
    let(:status) { 400 }

    it 'raises error' do
      expect { validator }.to raise_error(
        MobileSignalFetcher::BadRequest
      ) { |e| expected_message(e, status, body) }
    end
  end

  describe 'When response is invalid' do
    let(:status) { 200 }

    context 'when body is a nil' do
      let(:body) { nil }

      it 'raises error' do
        expect { validator }.to raise_error(
          MobileSignalFetcher::InvalidResponse
        ) { |e| expected_message(e, status, body) }
      end
    end

    context 'when body is a string' do
      let(:body) { 'TIMEOUT' }

      it 'raises error' do
        expect { validator }.to raise_error(
          MobileSignalFetcher::InvalidResponse
        ) { |e| expected_message(e, status, body) }
      end
    end
  end

  describe 'When response is empty' do
    let(:status) { 200 }
    let(:body) { {} }

    it 'raises error' do
      expect { validator }.to raise_error(
        MobileSignalFetcher::EmptyResponse
      ) { |e| expected_message(e, status, body) }
    end
  end

  describe 'When No Results' do
    let(:status) { 200 }
    let(:body) { { networkRank: 'No results for this area' } }

    it 'raises error' do
      expect { validator }.to raise_error(
        MobileSignalFetcher::NoResults
      ) { |e| expected_message(e, status, body) }
    end
  end

  after do
    MobileSignalFetcher.configuration.log = false
  end
end

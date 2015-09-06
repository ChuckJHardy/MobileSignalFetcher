require 'spec_helper'

describe MobileSignalFetcher::Validate do
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
  let(:body) { {} }
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
      ) do |e|
        expect(e.message).to eq(
          domain: 'www',
          url: 'example.com',
          options: { query: 1 },
          response: {
            status: status,
            body: body
          }
        )
      end
    end
  end

  describe 'When No Results' do
    let(:status) { 200 }
    let(:body) { { networkRank: 'No results for this area' } }

    it 'raises error' do
      expect { validator }.to raise_error(
        MobileSignalFetcher::NoResults
      ) do |e|
        expect(e.message).to eq(
          domain: 'www',
          url: 'example.com',
          options: { query: 1 },
          response: {
            status: status,
            body: body
          }
        )
      end
    end
  end

  after do
    MobileSignalFetcher.configuration.log = false
  end
end

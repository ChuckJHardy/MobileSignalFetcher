require 'spec_helper'
require 'mobile_signal_fetcher/configuration'

RSpec.describe MobileSignalFetcher::Configure do
  let(:instance) { Class.new { extend MobileSignalFetcher::Configure } }

  describe '#domain' do
    subject { instance.configuration.domain }

    let(:default_domain) { 'http://api.opensignal.com/v2/' }
    let(:new_domain) { 'http://localhost:1111' }

    it 'returns a default new_domain' do
      expect(subject).to eq(default_domain)
    end

    it 'returns altered new domain' do
      instance.configure { |config| config.domain = new_domain }
      expect(subject).to eq(new_domain)
    end
  end

  describe '#api_key' do
    subject { instance.configuration.api_key }

    let(:new_api_key) { '123' }

    it 'returns a default api key' do
      expect(subject).to eq(nil)
    end

    it 'returns altered api key' do
      instance.configure { |config| config.api_key = new_api_key }
      expect(subject).to eq(new_api_key)
    end
  end

  describe '#verbose' do
    subject { instance.configuration.verbose }

    it 'returns a default new_domain' do
      expect(subject).to eq(false)
    end

    it 'returns altered verbose' do
      instance.configure { |config| config.verbose = true }
      expect(subject).to eq(true)
    end
  end
end

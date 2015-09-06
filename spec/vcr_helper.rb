require 'spec_helper'

require 'vcr'
require 'webmock'

RSpec.configure do |config|
  config.before do
    MobileSignalFetcher.configuration.api_key = ENV['OPENSIGNAL_API_KEY']
  end

  config.after do
    MobileSignalFetcher.configuration.api_key = nil
  end
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('<OPENSIGNAL_API_KEY>') do
    ENV['OPENSIGNAL_API_KEY']
  end
end

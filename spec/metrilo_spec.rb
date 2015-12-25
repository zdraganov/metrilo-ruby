require 'spec_helper'

describe Metrilo do
  it 'has a version number' do
    expect(Metrilo::VERSION).not_to be nil
  end

  context 'configuration' do
    it 'configures api token properly' do
      Metrilo.configuration do |config|
        config.api_token = 'token'
      end

      expect(Metrilo.api_token).to eq('token')
    end

    it 'configures api secret properly' do
      Metrilo.configuration do |config|
        config.api_secret = 'secret'
      end

      expect(Metrilo.api_secret).to eq('secret')
    end

    it 'has default api url value' do
      expect(Metrilo.api_url).to eq('t.metrilo.com')
    end

    it 'configures api url properly' do
      Metrilo.configuration do |config|
        config.api_url = 'api.url'
      end

      expect(Metrilo.api_url).to eq('api.url')
    end
  end
end

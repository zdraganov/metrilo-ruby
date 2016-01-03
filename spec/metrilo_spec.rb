require 'spec_helper'

describe Metrilo do
  it 'has a version number' do
    expect(Metrilo::VERSION).not_to be nil
  end

  context 'configuration' do
    before(:each) do
      Metrilo.class_variable_set(:@@api_token, 'random_token_here')
      Metrilo.class_variable_set(:@@api_secret, 'random_secret_here')
      Metrilo.class_variable_set(:@@js_lib_url, 't.metrilo.com')
      Metrilo.class_variable_set(:@@tracking_url, 'p.metrilo.com')
      Metrilo.class_variable_set(:@@debug_mode, false)
    end

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

    it 'configures tracking url properly' do
      Metrilo.configuration do |config|
        config.tracking_url = 'tracking.url'
      end

      expect(Metrilo.tracking_url).to eq('tracking.url')
    end

    it 'has default tracking url value' do
      expect(Metrilo.tracking_url).to eq('p.metrilo.com')
    end

    it 'configures js library url properly' do
      Metrilo.configuration do |config|
        config.js_lib_url = 'js_lib.url'
      end

      expect(Metrilo.js_lib_url).to eq('js_lib.url')
    end

    it 'has default js library url value' do
      expect(Metrilo.js_lib_url).to eq('t.metrilo.com')
    end

    it 'configures debug mode properly' do
      Metrilo.configuration do |config|
        config.debug_mode = true
      end
      expect(Metrilo.debug_mode).to be(true)
    end

    it 'has default debug mode to false' do
      expect(Metrilo.debug_mode).to be(false)
    end

    context 'mandatory fields' do
      it 'raises exception when api token missing' do
        expect do
          Metrilo.configuration do |config|
            config.api_token = nil
          end
        end.to raise_error(RuntimeError, /Mandatory options api_token are not set/)
      end

      it 'raises exception when api token missing' do
        expect do
          Metrilo.configuration do |config|
            config.api_secret = nil
          end
        end.to raise_error(RuntimeError, /Mandatory options api_secret are not set/)
      end
    end
  end
end

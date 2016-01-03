require 'metrilo/version'
require 'metrilo/helpers/configuration'
require 'metrilo/helpers/js_helper'
require 'metrilo/client/event_queue'
require 'metrilo/client/api'

# Gem front point
module Metrilo
  extend Metrilo::Configuration

  define_setting :api_token, mandatory: true
  define_setting :api_secret, mandatory: true

  define_setting :js_lib_url, mandatory: true, default: 't.metrilo.com'
  define_setting :tracking_url, mandatory: true, default: 'p.metrilo.com'

  # define_setting :session_store

  define_setting :debug_mode, default: false
end

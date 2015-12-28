require 'metrilo/version'
require 'metrilo/helpers/configuration'
require 'metrilo/helpers/js_helper'
require 'metrilo/client/event_queue'
require 'metrilo/client/api'

# Gem front point
module Metrilo
  extend Metrilo::Configuration

  define_setting :api_token
  define_setting :api_secret

  define_setting :js_lib_url, 't.metrilo.com'
  define_setting :tracking_url, 'p.metrilo.com'

  define_setting :debug_mode, false
end

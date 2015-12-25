require 'metrilo/version'
require 'helpers/configuration'

# Gem front point
module Metrilo
  extend Configuration

  define_setting :api_token
  define_setting :api_secret

  define_setting :api_url, 't.metrilo.com'

  define_setting :debug_mode, false
end

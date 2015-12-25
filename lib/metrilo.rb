require 'metrilo/version'
require 'helpers/configuration'

module Metrilo
  extend Configuration

  define_setting :api_token
  define_setting :api_secret

  define_setting :api_url, 't.metrilo.com'
end

require 'base64'
require 'digest'

module Metrilo
  # Static class for back-end API calls
  class Api
    class << self
      def batch_call(event_queue)
        sorted_call  = plain_call(events).sort
        encoded_call = Base64.encode64(sorted_call)

        connection_adapter.post do |req|
          req.url('/bt')
          req.headers['Content-Type'] = 'application/json'
          req.body = signed_call(encoded_call)
        end
      end

      private

      def prepare_events(event_queue)
        result = []

        event_queue.tracked_events.each do |tracked_event|
          prepared_event =
          {
            event_type: tracked_event[:type],
            params: tracked_event[:data]
          }
        end

        result
      end

      def signed_call(encoded_call)
        {
          s: call + Digest::MD5.new.update(Metrilo.api_secret),
          hs: encoded_call
        }
      end

      def plain_call(event_queue)
        {
          token: Metrilo.api_token,
          events: prepare_events(event_queue),
          platform: %(
            Ruby #{defined? RUBY_VERSION ? RUBY_VERSION : 'unknown version'}
          ),
          version: Metrilo.version
        }
      end

      def connection_adapter
        return @faraday_adapter if @faraday_adapter

        @faraday_adapter = Faraday.new(url: "http://#{Metrilo.tracking_url}") do
          faraday.response :logger if Metrilo.debug_mode
          faraday.adapter Faraday.default_adapter
        end
      end
    end
  end
end

module Metrilo
  # Helper that renders Metrilo JS library and events processed
  module JsHelper
    def metrilo_tag_helper(event_queue)
      %(
        <script type="text/javascript">
          #{base_js_code}

          #{events_js_code(event_queue)}
        </script>
      )
    end

    def metrilo_empty_tag
      %(
        <script type="text/javascript">'
          #{base_js_code}
        </script>
      )
    end

    private

    # rubocop:disable Metrics/LineLength
    # rubocop:disable Metrics/AbcSize
    # rubocop:disable Metrics/MethodLength
    def events_js_code(event_queue)
      events_as_js = event_queue.tracked_events.map do |event|
        if event[:method] == :identify
          "metrilo.identify('#{event[:data][:id]}', #{event[:data][:params]})"
        else
          if event[:type] == :pageview
            "metrilo.event('#{event[:type]}', '#{event[:data]}', #{event[:meta_data]});"
          else
            "metrilo.event('#{event[:type]}', #{event[:data]}, #{event[:meta_data]})"
          end
        end
      end

      events_as_js.join("\n")
    end

    def base_js_code
      %(
          window.metrilo||(window.metrilo=[]),window.metrilo.queue=[],window.metrilo.methods=["identify","track","event","pageview","purchase","debug","atr"],
          window.metrilo.skelet=function(e){return function(){a=Array.prototype.slice.call(arguments);a.unshift(e);window.metrilo.queue.push(a)}};
          for(var i=0;window.metrilo.methods.length>i;i++){var mthd=window.metrilo.methods[i];window.metrilo[mthd]=window.metrilo.skelet(mthd)}
          window.metrilo.load=function(e){var t=document,n=t.getElementsByTagName("script")[0],r=t.createElement("script");
          r.type="text/javascript";r.async=true;r.src="//#{Metrilo.js_lib_url}/j/"+e+".js";n.parentNode.insertBefore(r,n)};
          metrilo.load("#{Metrilo.api_token}");
      )
    end
  end
end

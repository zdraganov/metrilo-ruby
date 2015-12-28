module Metrilo
  # The queue that is storing events done by someone between requests
  class EventQueue
    attr_reader :tracked_events

    def initialize(identity: nil, ip_address: nil)
      @tracked_events = []
      @identity = nil
      @ip_address = nil
    end

    def identify(email, name, first_name = nil, last_name = nil)
      data = {
        id: email,
        params: {
          email: email, name: name, first_name: first_name, last_name: last_name
        }
      }

      @identity = email

      add_event(:identify, :identify, data)
    end

    def search(query, result_count)
      data = {
        query: query, result_count: result_count
      }

      add_event(:track, :search, data)
    end

    def page_view(title, backend_hook = nil)
      add_event(:track, :pageview, title, backend_hook: backend_hook)
    end

    def view_category(category_id, category_name)
      data = { id: category_id, name: category_name }

      add_event(:track, :view_category, data)
    end

    def view_product(
      product_id, product_name, product_price, product_url, options = {}
    )
      data = {
        id: product_id, name: product_name, price: product_price, url: product_url
      }

      data[:image_url]  = options[:image_url] if options.key?(:image_url)
      data[:categories] = options[:categories] if options.key?(:categories)

      add_event(:track, :view_product, data)
    end

    def view_cart
      add_event(:track, :view_cart)
    end

    def add_to_cart(
      product_id, product_name, product_price, product_url, options = {}
    )
      data = {
        id: product_id, name: product_name,
        price: product_price, url: product_url
      }

      data[:quantity]     = options.key?(:quantity) ? options[:quantity] : 1
      data[:option_id]    = options[:option_id] if options.key?(:option_id)
      data[:option_name]  = options[:option_name] if options.key?(:option_name)

      data[:option_price] =
        options[:option_price] if options.key?(:option_price)

      data
    end

    def checkout_start
      add_event(:track, :checkout_start)
    end

    private

    def add_event(method, type, data = {}, meta_data = {})
      event = {
        method: method,
        type: type,
        data: data,
        meta_data: meta_data,
        identity: @identity,
        ip_address: @ip_address
      }

      @tracked_events << event
    end
  end
end

class EventQueue
  attr_reader :tracked_events

  def initialize
    @tracked_events = []
  end

  def identify(email, name, first_name = nil, last_name = nil)
    data = {
      id: email,
      params: {
        email: email, name: name, first_name: first_name, last_name: last_name
      }
    }

    add_event(:identify, :identify, data)
  end

  def search(query, result_count)
  end

  def page_view
  end

  def view_category
  end

  def view_product
  end

  def view_cart
  end

  def add_to_cart
  end

  def checkout_start
  end

  private

  def add_event(method, type, data, meta_data = nil)
    event = {
      method: method,
      type: type,
      data: data.merge(meta_data: meta_data)
    }

    @tracked_events << event
  end
end

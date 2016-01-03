module Metrilo
  # Configuration module for metrilo ruby
  module Configuration
    def configuration
      yield self
      check_mandatory_fields!
    end

    # rubocop:disable Metrics/LineLength
    def define_setting(name, mandatory: false, default: nil, supported_options: nil)
      check_default_and_supported!(mandatory, default, supported_options)
      add_to_mandatory_fields(name) if mandatory

      class_variable_set("@@#{name}", default)

      define_class_method("#{name}=") do |value|
        class_variable_set("@@#{name}", value)
      end

      define_class_method(name) do
        class_variable_get("@@#{name}")
      end
    end

    private

    def define_class_method(name, &block)
      (class << self; self; end).instance_eval do
        define_method name, &block
      end
    end

    def add_to_mandatory_fields(name)
      # Lazy init on those
      @mandatory_fields = [] if @mandatory_fields.nil?

      @mandatory_fields << name
    end

    def check_mandatory_fields!
      missing_mandatory_fields = []

      @mandatory_fields.each do |field|
        missing_mandatory_fields << field if class_variable_get("@@#{field}").nil?
      end

      fail %(
        Mandatory options #{missing_mandatory_fields.join(', ')} are not set
      ) if missing_mandatory_fields.any?
    end

    def check_default_and_supported!(mandatory, default, supported_options)
      return unless supported_options

      fail %(
        Supported options must be Array,
        but you passed #{supported_options.class_name}
      ) unless supported_options.is_a?(Array)

      # We skip the existance in supported options if
      # the field is mandatory and not set
      return if mandatory && default.nil?

      fail %(
        The default option #{default} is not found in
        supported options #{supported_options.join?(', ')}
      ) unless supported_options.include?(default)
    end
  end
end

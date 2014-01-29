module MiniTest::Metadata
  module ClassMethods
    # Returns Hash metadata for class' test methods
    def metadata
      @metadata ||= {}
    end
  end

  def self.included(klass)
    klass.extend ClassMethods
    klass.class_eval do
      class << self
        # @private
        alias :old_it :it

        # @private
        def it(description = "", *metadata, &block)
          old_it(description, &block).tap do |name|
            self.metadata[name] = _compute_metadata(metadata)
          end
        end

        def _compute_metadata(metadata)
          metadata.each_with_object({}) { |key, hash|
            if key.is_a?(Hash)
              hash.merge!(key)
            else
              hash[key] = true
            end
          }
        end
      end
    end
    super
  end

  # Returns Hash metadata for currently running test
  def metadata
    self.class.metadata[__name__] || {}
  end
end

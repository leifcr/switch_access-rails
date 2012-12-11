module SwitchAccess
  module Rails
    module ViewHelpers

      @@_sw_element_sci_class = nil

      def sw_element_init(options = {})
        sw_element_fini()
        sw_element_sci(options)
      end

      def sw_element_sci(options = {})
        @@_sw_element_sci_class = SwitchElements.new(options) if @@_sw_element_sci_class == nil
        @@_sw_element_sci_class
      end

      #
      # Reset counters
      #      
      def sw_element_reset_counters
        sw_element_sci().reset_counters()
      end

      #
      # Begin a switch element group
      #
      def sw_element_begin_group
        sw_element_sci().begin_group()
      end

      def sw_element_fini
        @@_sw_element_sci_class = nil
      end

      #
      # End a switch element group
      #
      def sw_element_end_group
        ret = sw_element_sci().end_group()
        if (ret < 0)
          sw_element_fini()
        end
        ret
      end

      #
      # Get the next switch element class
      #
      def sw_element_next_class
        sw_element_sci().next_element_class()
      end

      #
      # Get javascript initializer for switch access
      #
      def sw_element_js_initializer(options = {})
        str = 
        <<-js
        $(document).ready(function() {
          if (typeof window._railsaccess == 'undefined') {
            window._rails_sw_access = new SwitchAccess(#{options.to_json});
          }
        });
        js
        javascript_tag str.html_safe
      end

      class SwitchElements
        def initialize(options = {})
          @options = options
          @options[:element_class_name] = "switch-element-" if !options.has_key?(:element_class_name)
          reset_counters()
        end

        def reset_counters()
          @parent_next_element_id = 0
          @next_element_id        = 0
          @level                  = 0
        end
        
        def begin_group
          @parent_next_element_id = @next_element_id + 1
          @next_element_id = 1
          @level += 1
          "#{@options[:element_class_name]}#{@parent_next_element_id}"
        end
        
        def end_group
          @level -= 1
          @next_element_id = @parent_next_element_id
        end

        #
        # Get the next switch element class
        #
        def next_element_class
          "#{@options[:element_class_name]}#{increase_next_id()}"
        end
        #
        # Increase the switch element id and return it
        #
        def increase_next_id
          @next_element_id += 1
        end
      end # class SwitchElements

    end # module ViewHelpers
  end # module Rails
end # module SwitchAccess

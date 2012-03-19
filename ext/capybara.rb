module Capybara
  module Node
    class Element < Base
      #Returns the full css locator used to fine this element
      def css_locator
        temp_locator = locator
        temp_parent = parent
        while temp_parent.class == Capybara::Node::Element
          temp_locator = temp_parent.locator + " " + temp_locator
          temp_parent = temp_parent.parent
        end
        temp_locator
      end

      def locator
        @selector.locator
      end

      def parent
        @parent
      end
    end
  end
end

module SitePrism::ElementContainer

  def root_element element_name, element_locator = nil
    if element_locator.nil?
      define_method element_name.to_s do
        raise SitePrism::NoLocatorForElement.new("#{self.class.name} => :#{element_name} needs a locator")
      end
    else
      add_element_name element_name.to_s
      define_method element_name.to_s do
        find element_locator
      end
    end
    create_existence_checker element_name, element_locator
    create_waiter element_name, element_locator
  end

  def root_elements collection_name, collection_locator = nil
    if collection_locator.nil?
      define_method collection_name.to_s do
        raise SitePrism::NoLocatorForElement.new("#{self.class.name} => :#{element_name} needs a locator")
      end
    else
      add_element_name collection_name
      define_method collection_name.to_s do
        all locator
      end
    end
    create_existence_checker collection_name, collection_locator
    create_waiter collection_name, collection_locator
  end
  alias :root_collection :root_elements
end

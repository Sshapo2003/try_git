class Helpers::PageManagerEditTemplateHelper
  class << self
     def update_title title
      wildfire = Model::Wildfire.new
      wildfire.template_content_editor.set_template_name title
    end

    def get_title
      wildfire = Model::Wildfire.new
      wildfire.template_content_editor.get_template_name
    end

    def update_template_description description
      wildfire = Model::Wildfire.new
      wildfire.template_content_editor.set_template_description description
    end

    def get_template_description
      wildfire = Model::Wildfire.new
      wildfire.template_content_editor.get_template_description
    end

    def update_screenshot screenshot
      wildfire = Model::Wildfire.new
      wildfire.template_content_editor.set_screenshot screenshot
    end

    def has_screenshot?
      wildfire = Model::Wildfire.new
      wildfire.template_content_editor.has_screenshot?
    end

    def choose_category category
      wildfire = Model::Wildfire.new
      wildfire.template_content_editor.choose_category category
    end

    def choose_tag tag
      wildfire = Model::Wildfire.new
      wildfire.template_content_editor.choose_tag tag
    end

    def tags
      wildfire = Model::Wildfire.new
      wildfire.template_content_editor.tags
    end

    def set_privacy privacy
      wildfire = Model::Wildfire.new
      wildfire.template_content_editor.set_privacy privacy
    end

    def privacy_value
      wildfire = Model::Wildfire.new
      wildfire.template_content_editor.privacy_value
    end

    def go_back
      wildfire = Model::Wildfire.new
      wildfire.template_content_editor.go_back_button.click
    end
  end
end
class Model::Page::WildfireappCountdownTemplateEditHeader < SitePrism::Page
  element :save_button, 'button#internal_widget_submit'

  def body_text(text)
    script_executed = false
    attempts = 0
    while !script_executed && attempts < 30
      attempts = attempts + 1
      begin
        page.execute_script "tinymce.get('internal_widget_body').setContent('#{text}')"
        script_executed = true
      rescue
        # page not rendered yet - wait a while
        sleep 0.5
      end
    end
  end

  def is_loaded?
    page.current_url.include? 'internal_widgets'
  end
end

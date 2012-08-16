class Model::Page::WildfireappCountdownTemplateEditHeader < SitePrism::Page
  element :save_button, ".btn-primary"

  def body_text(text)
    script_executed = false
    attempts = 0
    while !script_executed && attempts < 30
      attempts = attempts + 1
      begin
        page.execute_script %{editor.setValue("#{text}")}
        if page.evaluate_script %{editor.getValue()} == text then script_executed = true end
      rescue
        # maybe page not rendered yet - wait a while
        sleep 0.5
      end
    end
  end

  def is_loaded?
    page.current_url.include? 'internal_widgets'
  end
end

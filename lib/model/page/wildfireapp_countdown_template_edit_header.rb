class Model::Page::WildfireappCountdownTemplateEditHeader < SitePrism::Page
  element :save_button, 'button#internal_widget_submit'

  def body_text(text)
    attempts = 0
    while attempts < 30 && !body_contains?(text)
      begin
        attempts += 1
        set_body_text(text)
      rescue Exception => e
        sleep 0.5
        # Keep trying until timeout is reached
      end
    end
  end

  def set_body_text(text)
    page.execute_script "tinymce.get('internal_widget_body').setContent('#{text}')"
  end

  def body_contains?(text)
    attempts = 0
    got_text = false
    while attempts < 30 && !got_text
      begin
        attempts += 1
        got_text = page.html != nil
      rescue Exception => e
        sleep 0.5
        # Keep trying until timeout is reached
      end
    end
  end

  def is_loaded?
    page.current_url.include? 'internal_widgets'
  end
end
